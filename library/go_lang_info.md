The Go Programming Language: Информация
=======================================

Содержание:

- Изучение Go
- Справочники
- Инструменты
- Источники данных
- Материалы


Изучение Go
-----------

Начинаем с официальных ресурсов: сначала [A Tour of Go](https://tour.golang.org)
и [How to Write Go Code](https://golang.org/doc/code.html).

После хорошо заходит серия коротких статей
[Getting Started on Heroku with Go](https://devcenter.heroku.com/articles/getting-started-with-go)
после которой получаешь представление о реальном веб-приложении на Go.

Рекомендую закрепить знания и написать простое веб-приложение на Go, например:

    First task​: Build a data model for the diver using PostgreSQL.
    Second task​: Build a simple service that provides the following API:
      * (POST) /import : Imports the diver's data into the datastore using
        the data model implemented before.
      * (GET) /diver/:id : Gets a diver's info (in a json format) by his id.

    divers data:
    [{"id":5,"name":"Albert Einstein","certification_card":"MINA28672"},
    {"id":1352,"name":"Isaac Newton","certification_card":"LOOS28463"},
    {"id":2,"name":"Galileo Galilei","certification_card":"CSUE39267"},
    {"id":7,"name":"Charles Darwin","certification_card":"LEER2735"},
    {"id":9,"name":"Marie Curie","certification_card":"MOON99245"},
    {"id":8,"name":"Stephen Hawking","certification_card":"SNEWP62293"}]

    Third task: Upload the metrics web app to a cloud provider, such as
    Heroku/DigitalOcean/aws/google appengine.

Теперь следует вернуться к официальной документации, пройтись
по [The Go Programming Language Specification](https://golang.org/ref/spec),
внимательно изучить [Effective Go](https://golang.org/doc/effective_go.html)
и [FAQ](https://golang.org/doc/faq). В разделе "Documents" ещё уйма материалов
в Wiki и в блоге, но их можно оставить на потом.

Есть бесплатная онлайн-книга для начинающих
[An Introduction to Programming in Go](http://www.golang-book.com/books/intro)
by Caleb Doxsey (2012) и её, по мнению некоторых людей, неплохой перевод
[Введение в программирование на Go](http://golang-book.ru).
@dymio: «Я не читал, ничего сказать про них не могу».

Также рекомендуют книгу [The Go Programming Language](http://www.gopl.io)
авторства Alan A. A. Donovan и Brian W. Kernighan. Есть издание Oct 26, 2015,
так что довольно свежая книга.
@dymio: «И эту книгу не читал».


Справочники
-----------

* [golang.org/pkg](https://golang.org/pkg/)
  — справочник по пакетам, включающий стандартную библиотеку

    @dymio: «Тот справочник, к которому будешь обращаться чаще всего»

* [golang.org/ref/spec](https://golang.org/ref/spec)
  — справочник по языку

    @dymio: «Чтобы подглядеть конструкции языка — само то»

* [Go database/sql tutorial](http://go-database-sql.org/)
  — мини-курс по работе с базой данных

    @dymio: «Понять как сделать простые действия с базой данных в Go бывает
    непросто после того, как Rails нас избаловал. Этот туториал сэкономил
    мне время на поиск простых решений, которые оказалось куда сложнее находить
    в pkg/database/sql»


Инструменты
-----------

* [Go vendor tool](https://github.com/kardianos/govendor)

    @dymio: \[1+\] «Тулза, которая позволяет хранить пакеты для приложения не
    в общей директории `$GOPATH/src`, а в директории `vendor` внутри проекта
    и вести файл `vendor.json` в котором перечислены все зависимости.
    Это очень важно и для того, чтобы зависимости проектов не мешали друг другу,
    и для командной работы — обновить зависимости добавленные коллегой можно
    одной командой. А то, что этот инструмент использует стандартную для языка
    директорию `vendor` и не мешает использовать привычный `go run` делает его
    must have для любого приложения на Go, по моему мнению.»

* [Gin, a HTTP web framework](https://github.com/gin-gonic/gin)

    @dymio: \[1+\] «Простой и интуитивный фреймворк с хорошей документацией.
    Выбрал его по рекомендации туториала на Heroku и не пожалел — проблем с ним
    вообще не возникло.»

* [GORM, ORM library](https://github.com/jinzhu/gorm)

    @dymio: «Сам не использовал. Мне его посоветовал Олег Леонтьев. По его
    словам инструмент удобный в начале, но когда добираешься до более сложных
    конструкций, вроде необычного запроса данных через has many связь,
    становится очень непросто понять, как это сделать.»

* [GoHeft](https://github.com/essentialkaos/goheft)
  — simple utility for listing sizes of all used static libraries compiled
  into golang binary.


Источники данных
----------------

* [The Go Documentation page](https://golang.org/doc/)
  — official site with a lot of really usefull links.

* [The Go Wiki](https://github.com/golang/go/wiki)

* [Awesome Go](https://awesome-go.com)
  — a curated list of awesome Go frameworks, libraries and software

* [Go News](https://twitter.com/golang_news) twitter

* [4gophers](https://4gophers.ru) — по-русски статьи, новости, подборка видео,
  Slack-сообщество и пр.


Материалы
---------

* [Go and a not tiny amount of memory]
  (https://hackernoon.com/go-and-a-not-tiny-amount-of-memory-a7a9430d4d22)
  — article by Phil Pearl от 17 мая 2017.
  Была [рекомендована](https://twitter.com/andy_one/status/869497367980113921)
  Andy One (andy_one).

* [Сервисы на Go в Badoo: как мы их пишем и поддерживаем](https://habrahabr.ru/company/badoo/blog/328062/)
  — статья lu4e3ar от 16 мая 2017

* [Лекции Техносферы: Программирование на Go](https://habrahabr.ru/company/mailru/blog/327966/)
  — курс видео-лекций на Хабре от 10 мая 2017

* [Go дайджест. 30 марта — 13 апреля 2017](https://habrahabr.ru/post/326376/)
  — статья Игоря Фокусова (fokusov) от 13 апреля 2017

* [Go дайджест. 15 — 30 марта 2017](https://habrahabr.ru/post/325222/)
  — статья Игоря Фокусова (fokusov) от 30 марта 2017

* [Go дайджест. 1 — 14 марта 2017](https://habrahabr.ru/post/323942/)
  — статья Игоря Фокусова (fokusov) от 15 марта 2017

* [Profiling and optimizing Go web applications]
  (http://artem.krylysov.com/blog/2017/03/13/profiling-and-optimizing-go-web-applications/)
  — article by Artem Krylysov от 13 марта 2017.
  Есть [перевод](https://habrahabr.ru/company/badoo/blog/324682/)
  Павла Мурзакова (lu4e3ar)

* [Style guideline for Go packages](https://rakyll.org/style-packages/)
  — article by Jaana B. Dogan (rakyll) от 14 января 2017.
  Была [рекомендована](https://twitter.com/alexeykolosov/status/827220373179613188)
  Алексеем Колосовым.

* [Calling Go Functions from Other Languages]
  (https://dev.to/vladimirvivien/calling-go-functions-from-other-languages)
  — article by Vladimir Vivien от 27 февраля 2017.
  Есть [перевод](https://habrahabr.ru/company/mailru/blog/324250/) AloneCoder.

    @dymio: \[1+\]

* [Golang tutorial series](https://golangbot.com/learn-golang-series/)
  — tutorial by Naveen Ramanathan начатый 2 февраля 2017

* [Building Go Web Applications and Microservices Using Gin]
  (https://semaphoreci.com/community/tutorials/building-go-web-applications-and-microservices-using-gin)
  and [Test-driven Development of Go Web Applications with Gin]
  (https://semaphoreci.com/community/tutorials/test-driven-development-of-go-web-applications-with-gin)
  — articles by Kulshekhar Kabra от 28 сентября 2016

    @dymio: \[1\] «Хорошие статьи чтобы шаг за шагом сделать полноценное
    веб-приложение на Go со всеми плюшками, вроде тестов. Но уж очень
    многословные и не всегда понятные. Я попробовал изучить только вторую
    статью, чтобы добавить тесты в своё приложение, но не разобрался, так что
    читать нужно обе статьи полностью.»

* [Как я 8 месяцев переписывал свою криптовалюту с PHP на Go. Часть 1]
  (https://habrahabr.ru/company/dcoin/blog/272695/),
  [Как я 8 месяцев переписывал свою криптовалюту с PHP на Go. Часть 2]
  (https://habrahabr.ru/post/273333/),
  [Как я 8 месяцев переписывал Dcoin на Go… про Катю, в общем]
  (https://habrahabr.ru/post/274885/),
  [Катя, Go, Dcoin и Android](https://habrahabr.ru/post/277099/),
  [Dcoin на IOS… и Катя. Финал](https://habrahabr.ru/post/281709/)
  — серия статей Олега Стреленко (c-darwin) от 10 декабря 2015 – 15 апреля 2016.

    @dymio: «Хер знает что он там про техническую часть писал — я про Катю читал :)»

* [Визуализация concurrency в Go с WebGL](https://habrahabr.ru/post/276255/)
  — статья divan0 (Ваня) от 31 января 2016,

    @dymio: \[1\] «Статья неплохо помогает пониманию того, как работают
    goroutines и даёт много примеров кода с использованием их и каналов.
    А ещё даёт визуальный пример разницы между concurrency и параллелизмом.»

* [Why Go is a poorly designed language]
  (https://medium.com/@tucnak/why-go-is-a-poorly-designed-language-1cc04e5daf2)
  — article by Ian Byrd от 28 октября 2015.
  Есть [перевод](https://habrahabr.ru/post/269731/) от Ильи Ковалевского.

    @dymio: \[1+\] «Стоит забить на излишнюю эмоциональность статьи и прочитать
    про недостатки (или особенности, кому как приятнее) языка Go отлично
    описанные в этой статье. Это поможет не наступить на грабли при работе.»

* [Эволюция Go](https://habrahabr.ru/post/262295/)
  — перевод конспекта доклада Роберта Грисмера Владимиром Масловым от 11 июля 2015

* [С чего начать новичку в Go](https://habrahabr.ru/post/269355/)
  — статья M0sTH8 от 23 октября 2015. @dymio: «Взял с неё много неплохих ссылок,
  но они уже в этом документе, так что нет смысла читать, ИМХО»

* [Go-дайджест: июнь 2014](https://habrahabr.ru/post/228627/)
  — статья Владимира Маслова (HotWaterMusic) от 4 июля 2014

* [7 common mistakes in Go and when to avoid them](https://www.youtube.com/watch?v=29LLRKIL_TI)
  — talk by Steve Francia от 10 июня 2015

* [Is Go An Object Oriented Language?](http://spf13.com/post/is-go-object-oriented)
  — article by Steve Francia от 9 июня 2014.
  Есть [перевод](https://habrahabr.ru/post/225907/) Максима Куприянова (Xlab).

    @dymio: \[1\] «Статья хороша тем, что она помогает понять язык Go лучше тем,
    кто работал до этого с ООП языками. В примерах показано, как лучше написать
    аналог класса в Go, полиморфизм и прочее.»

* [Why Go Is Not Good](http://yager.io/programming/go.html)
  — article by Will Yager от июня 2014

* ["On Go"](http://cowlark.com/2009-11-15-go/)
  — article by David Given от 17 ноября 2009
