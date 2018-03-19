# Author: @dymio at Codenohito
# 2018
#
# Ruby cheatsheet
#

# Variables

local_variable = value
local_variable ||= another_value
local_variable += additional_value

@instance_varible

@@class_variable

# Control structures

if something
  title = new_title
elsif something_more
  title = another_title
else
  title = default_title
end

title = new_title if something

ttype = case title
        when Numeric
          'Number'
        when String
          'String'
        else
          "Don't know"
        end

# Arrays
array = []
poem_words = ['twinkle', 'little', 'star', 'how', 'I', 'wonder']
poem_words = %w{twinkle bitter star how I wonder}
poem_words[1] = 'little'
poem_words << 'you'
poem_words.each { |word| puts word }
poem_words.map { |word| word.size } # [7, 6, 4, 3, 1, 6, 3]
poem_words.inject(0) { |result, word| word.size + result } # 30

# Hashes
hash = {}
freq = { "I" => 1, "don't" => 1, "like" => 1, "spam" => 963 }
book_info = { :first_name => 'Russ', :last_name => 'Olsen' }
book_info = { first_name: 'Russ', last_name: 'Olsen' }
book_info[:middle_name] = 'Jackson'
book_info.each { |name, value| puts "#{name} => #{value}"}

# Strings
str = 'Say it ain\'t so! And this is a backslash: \\'
str = "I have a tab: \t and a newline: \n And can put 'single quotes' here"
str = "Also I can embed an exapression like this: #{some_expression}"
quote = %q("Stop", she said, "I can't live without 's and "s.")
quote = %Q<"Stop", she said, "I can't #{what} without 's and "s.">
a_multiline_string = "a multi-line
string"
heres_one = <<EOF
This is the beginning of my here document.
And this is the end.
EOF
str.each_char { |c| puts c }
str.each_byte { |b| puts b }

# Methods

def echo_at_least_two(first_arg, *middle_args, last_arg)
  puts "The first argument is #{first_arg}"
  middle_args.each { |arg|puts "A middle argument is #{arg}" }
  puts "The last argument is #{last_arg}"
end

# Classes

class Document
  # class RomanceNovel < Document

  CONTANT_CODE = 12

  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def ==(other)
    return true if other.equal?(self)
    return false unless other.instance_of?(self.class)
    folder == other.folder && name == other.name
  end

  def title=(value)
    @title = value
  end

  def words
    @content.split
  end

  def add_authors(*names)
    @author += names.join(' ')
  end
  # doc.add_authors( 'Strunk', 'White' )

  def load_font(name, specification_hash)
    # do something
  end
  # doc.load_font 'times roman', size: 12, style: 'italic', weight: 700

  def about_me
    puts "I am #{self}"
    puts "My title is #{self.title}"
    puts "I have #{self.word_count} words"
  end

  private

  def word_count
    words.size
  end

  # or event private def word_count; words.size end
end

doc = Document.new 'Ethics', 'Spinoza', 'By that which is...'

puts Document::CONTANT_CODE

puts doc.public_methods

# Modules

module Jigga
  class Gagga
  end
end

the_little_g = Jigga::Gagga

# Blocks

def some_method(lmd, &block)
  lmd.call if lmd
  if block_given?
    block.call # or yield
  end
end

lmd = -> { puts 'hello'  } # or lambda { puts 'hello' }
some_method(lmd) { puts 'world' }
