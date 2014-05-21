HTML Style Guide
================

* Use `UTF-8` as the source file encoding

* Use soft-tabs with a two space indent

* Use only lowercase

* Use valid HTML where possible:

    * DOCTYPE каждой страницы корректно указан `<!DOCTYPE html>`
    
    * теги, которые надо закрывать мы закрываем в правильном порядке (`<div> ... <p>...</p></div>`)
    
    * теги, которые не нужно закрывать, пишем в соответствии с doctype: если html, то `<br>`, а если xhtml, то `<br />`

    * inline теги рекомендуется писать в строке (`<p>Hello my <small>little</small> <a href="#">friend</a></p>`), а блочные стоит разделять на разные строки
    
    * When quoting attributes values, use double quotation marks

* Use HTML according to its purpose (try to be more semantic): use tags `header`, `footer`, `section`, `article`, `adress`, `abbr`; 

* есть корневой тег `<html>`, а `<head>` и `<body>` единственные 'дети' - все остальные теги в них

* Provide alternative contents for multimedia: `<img src="spreadsheet.png" alt="Spreadsheet screenshot.">`

* Try to separate structure from presentation from behavior:

        <!-- Not recommended -->
        <!DOCTYPE html>
        <title>HTML sucks</title>
        <link rel="stylesheet" href="base.css" media="screen">
        <link rel="stylesheet" href="grid.css" media="screen">
        <link rel="stylesheet" href="print.css" media="print">
        <h1 style="font-size: 1em;">HTML sucks</h1>
        <p>I’ve read about this on a few sites but now I’m sure:
          <u>HTML is stupid!!1</u>
        <center>I can’t believe there’s no way to control the styling of
          my website without doing everything all over again!</center>

        <!-- Recommended -->
        <!DOCTYPE html>
        <title>My first CSS-only redesign</title>
        <link rel="stylesheet" href="default.css">
        <h1>My first CSS-only redesign</h1>
        <p>I’ve read about this on a few sites but today I’m actually
          doing it: separating concerns and avoiding anything in the HTML of
          my website that is presentational.</p>
        <p>It’s awesome!</p>

* Do not use entity references

        <!-- Not recommended -->
        The currency symbol for the Euro is &ldquo;&eur;&rdquo;.

        <!-- Recommended -->
        The currency symbol for the Euro is “€”.

* Omit type attributes for style sheets and scripts (if html5)

        <!-- Not recommended -->
        <link rel="stylesheet" href="//www.google.com/css/maia.css"
          type="text/css">
        <script src="//www.google.com/js/gweb/analytics/autotrack.js"
          type="text/javascript"></script>

        <!-- Recommended -->
        <link rel="stylesheet" href="//www.google.com/css/maia.css">
        <script src="//www.google.com/js/gweb/analytics/autotrack.js"></script>

* Try to make html page [valid](http://validator.w3.org/) as much as possible
