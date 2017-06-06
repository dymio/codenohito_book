Изучение Go
===========

Начинаем с официальных ресурсов: сначала [A Tour of Go](https://tour.golang.org)
и [How to Write Go Code](https://golang.org/doc/code.html).

После хорошо заходит серия коротких статей
[Getting Started on Heroku with Go](https://devcenter.heroku.com/articles/getting-started-with-go)
после которой получаешь представление о реальном веб-приложении на Go.

Тут я рекомендую закрепить знания и написать простое веб-приложение на Go:

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

https://semaphoreci.com/community/tutorials/building-go-web-applications-and-microservices-using-gin
https://semaphoreci.com/community/tutorials/test-driven-development-of-go-web-applications-with-gin
?

Справочники
-----------

* https://golang.org/pkg/
* https://golang.org/ref/spec
* http://go-database-sql.org/


Инструменты
-----------

* https://github.com/kardianos/govendor
* https://github.com/gin-gonic/gin
* https://github.com/jinzhu/gorm


Материалы
---------

* [The Go Programming Language](https://golang.org/) official site with a lot
  of really usefull links in "Documentation" page.

* ["Go and a not tiny amount of memory"]
  (https://hackernoon.com/go-and-a-not-tiny-amount-of-memory-a7a9430d4d22)
  17 мая 2017, Phil Pearl, статья на Hackernoon

    Была [рекомендована](https://twitter.com/andy_one/status/869497367980113921)
    Andy One (andy_one).

* [«Сервисы на Go в Badoo: как мы их пишем и поддерживаем»]
  (https://habrahabr.ru/company/badoo/blog/328062/)
  16 мая 2017, lu4e3ar, статья на Хабре

* [«Лекции Техносферы: Программирование на Go»]
  (https://habrahabr.ru/company/mailru/blog/327966/)
  10 мая 2017, курс видео-лекций на Хабре

* [«Go дайджест. 30 марта — 13 апреля 2017»](https://habrahabr.ru/post/326376/)
  13 апреля 2017, Игорь Фокусов (fokusov), статья на Хабре

* [«Go дайджест. 15 — 30 марта 2017»](https://habrahabr.ru/post/325222/)
  30 марта 2017, Игорь Фокусов (fokusov), статья на Хабре

* [«Go дайджест. 1 — 14 марта 2017»](https://habrahabr.ru/post/323942/)
  15 марта 2017, Игорь Фокусов (fokusov), статья на Хабре

* ["Profiling and optimizing Go web applications"]
  (http://artem.krylysov.com/blog/2017/03/13/profiling-and-optimizing-go-web-applications/)
  13 марта 2017, Artem Krylysov, статья в персональном блоге

    Перевод на Хабре Павла Мурзакова (lu4e3ar):
    [«Профилирование и оптимизация веб-приложений на Go»]
    (https://habrahabr.ru/company/badoo/blog/324682/)

* ["Golang tutorial series"](https://golangbot.com/learn-golang-series/)
  2 февраля 2017 по 27 мая 2017 (17 часть), Naveen Ramanathan,
  серия статей на личном сайте

* ["Style guideline for Go packages"](https://rakyll.org/style-packages/)
  14 января 2017, Jaana B. Dogan (rakyll), статья в личном блоге

    Была
    [рекомендована](https://twitter.com/alexeykolosov/status/827220373179613188)
    Алексей Колосов (alexeyKolosov)

* [«Визуализация concurrency в Go с WebGL»](https://habrahabr.ru/post/276255/)
  31 января 2016, divan0 (Ваня), статья на Хабре

* [«Как я 8 месяцев переписывал свою криптовалюту с PHP на Go. Часть 1»]
  (https://habrahabr.ru/company/dcoin/blog/272695/)
  10 декабря 2015, c-darwin, статья на Хабре

* ["Why Go is a poorly designed language"]
  (https://medium.com/@tucnak/why-go-is-a-poorly-designed-language-1cc04e5daf2)
  28 октября 2015, Ian Byrd, статья на Medium

    Перевод на Хабре:
    [«Почему Go — это плохо продуманный язык программирования»]
    (https://habrahabr.ru/post/269731/)

* [«С чего начать новичку в Go»](https://habrahabr.ru/post/269355/)
  23 октября 2015, M0sTH8, статья на Хабре

    @dymio: «Пока не прочитал, но в статье много ссылок на стартовые материалы,
    книги и статьи. С виду большой и хороший справочный материал.»

* ["On Go"](http://cowlark.com/2009-11-15-go/)
  25 сентября 2015, David Given, статья на личном сайте

* [«Go-дайджест: июнь 2014»](https://habrahabr.ru/post/228627/)
  4 июля 2014, Владимир Маслов (HotWaterMusic), статья на Хабре


Источники данных
----------------

* [Go News](https://twitter.com/golang_news) twitter


Инструменты
-----------

* [GoHeft](https://github.com/essentialkaos/goheft)

    Simple utility for listing sizes of all used static libraries compiled into golang binary.
