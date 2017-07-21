#!/usr/bin/env ruby

DEF_WORK_HOURS_IN_MONTH = 88
UPWORK_MULTIPLIER = 0.2

DOLLAR_RATE = 58.5

CHARGE_ONE = 1.2
CHARGE_TWO = 1.5


# Функция рассчёта себестоимости часа работы сотрудника.
# Без учёта выплат за сотрудника. Грубо говоря по-чёрному.
# Параметры:
#   hour_rate - [number] - сумма оплаты работнику за час работы
#   work_hours_in_month - [number] - сколько часов сотрудник работает в месяц
#   office - [boolean] - работнику предоставляется офис?
#   usd - [boolean] - работаем ли с иностранным клиентом с рассчётом в долларах?
#   upwork - [boolean] - работаем через Upwork?
#
def calc_cost_price hour_rate, work_hours_in_month, office, usd, upwork
  x = hour_rate.to_f

  multiplier = 1.0
  fixed_in_month = 0.0

  multiplier += 0.06 # налог по УСН — 6% от дохода

  # фиксированные страховые взносы в год 27 990 рублей, из которых:
  #   23 400 рублей — на пенсионное страхование;
  #   4 590 рублей — на медицинское страхование.
  # но когда доход становится больше 300 000 рублей, просто учтём 1% от дохода
  # в качестве страховых взносов и он будет включать в себя фиксированную часть.
  multiplier += 0.01

  fixed_in_month += 2980.0 # ежемесячное обслуживание счётов в банке
  multiplier += 0.005 # комиссия за вывод наличных

  if office
    fixed_in_month += 5000.0 # аренда места в офисе
    fixed_in_month += 1000.0 # интернет в офисе
  end

  if usd
    # валютный контроль: 600 р. за вывод и считаем, что выводим по 100 000 р.
    multiplier += 0.006
    multiplier += 0.0065 # комиссия за продажу валюты
  end

  if usd && upwork
    multiplier += UPWORK_MULTIPLIER # комиссия Upwork
    multiplier += UPWORK_MULTIPLIER * 0.18 # 18% НДС на услуги Upwork

    # Берётся 30$ за один перевод денег через Wire Transfer (банк -> банк).
    # Будем считать, что за раз выводим аналог 100 000 рублей.
    # Значит множитель можно рассчитать как:
    wire_transfer_multiplier = (30.0 * DOLLAR_RATE) / 100000.0
    multiplier += wire_transfer_multiplier
    multiplier += wire_transfer_multiplier * 0.18 # 18% НДС на услуги
  end

  cost_price = x * multiplier + fixed_in_month / work_hours_in_month.to_f
  cost_price = cost_price / DOLLAR_RATE if usd

  cost_price
end

## Data

positions = [
  { name: 'Джун',    rate: 180 },
  { name: 'Младший', rate: 300 },
  { name: 'Миддл',   rate: 540 },
  { name: 'Старший', rate: 780 },
  { name: 'Лид',     rate: 1020 }
]

if ARGV && ARGV.length > 0
  ARGV.length.times do |i|
    positions << { name: "A#{i + 1}", rate: (ARGV[i].to_f) }
  end
end

## Utility functions

def prepV(val, usd = false)
  if usd
    str = "$%.2f" % val
  else
    str = val.is_a?(Float) ? val.round.to_s : val.to_s
  end
  ' ' * (6 - str.size) + str
end

def sixtyficate(val)
  (val / 6).round * 6
end

def puts_line(dscr, cost_price, usd = false)
  if usd
    price_one = sixtyficate(cost_price * CHARGE_ONE * 100.0) / 100.0
    price_two = sixtyficate(cost_price * CHARGE_TWO * 100.0) / 100.0
  else
    price_one = sixtyficate cost_price * CHARGE_ONE
    price_two = sixtyficate cost_price * CHARGE_TWO
  end

  puts "|   #{prepV dscr} |        " \
       "| #{prepV cost_price, usd } " \
       "| #{prepV price_one, usd } " \
       "| #{prepV price_two, usd } |"
end

## Header

puts ' '
puts "| position | ставка | себест " \
     "| #{prepV '+' + ((CHARGE_ONE - 1) * 100).round.to_s + '%'} " \
     "| #{prepV '+' + ((CHARGE_TWO - 1) * 100).round.to_s + '%'} |"
puts '|----------|--------|--------|--------|--------|'

## Body

positions.each_with_index do |pos, indx|
  puts '|----------------------------------------------|' unless indx == 0

  puts "| #{pos[:name]}#{' ' * (8 - pos[:name].size)} " \
       "| #{prepV pos[:rate]} " \
       "| #{' ' * 24} |"

  # Клиент из России; Сотрудник работает удалённо
  x = calc_cost_price pos[:rate], DEF_WORK_HOURS_IN_MONTH, false, false, false
  puts_line 'rmt', x

  # Клиент из России; Сотрудник работает в офисе
  x = calc_cost_price pos[:rate], DEF_WORK_HOURS_IN_MONTH, true, false, false
  puts_line 'ofc', x

  # Заграничный клиент; Сотрудник работает удалённо
  x = calc_cost_price pos[:rate], DEF_WORK_HOURS_IN_MONTH, false, true, false
  puts_line 'rmt', x, true

  # Заграничный клиент; Сотрудник работает в офисе
  x = calc_cost_price pos[:rate], DEF_WORK_HOURS_IN_MONTH, true, true, false
  puts_line 'ofc', x, true

  # Заграничный клиент, через Upwork; Сотрудник работает удалённо
  x = calc_cost_price pos[:rate], DEF_WORK_HOURS_IN_MONTH, false, true, true
  puts_line 'upw_r', x, true

  # Заграничный клиент, через Upwork; Сотрудник работает в офисе
  x = calc_cost_price pos[:rate], DEF_WORK_HOURS_IN_MONTH, true, true, true
  puts_line 'upw_o', x, true
end

## Footer

puts ' '
puts 'Где:'
puts "  Курс доллара: #{DOLLAR_RATE}"
puts "  Принимается, что член команды работает " \
       "в месяц #{DEF_WORK_HOURS_IN_MONTH} часов"
puts '  Итоговые цены округлены, чтобы удобно делить их на 6.'
puts ' '
