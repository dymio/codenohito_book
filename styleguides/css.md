CSS Style Guide
===============

Methodology
-----------

При создании стилей следует мысленно разделять страницы на отдельные **блоки**. Шапка, поиск, навигация, последние статьи - всё это блоки.

Стили для каждого блока следует писать таким образом, чтобы он был как можно более независим от других блоков. Для этого блоку выбирается семантическое имя класса: `.news-line`, `.main-nav`, `.tiles-collection`. Имена должны достаточно точно отражать назначение блока. Например, `.news-line` - блок для отображения новостей в линию, а блок `.tiles-collection` это коллекция ячеек не привязанная ни к какому объекту системы, так как в таком виде мы можем показывать, как услуги, так и товары или выполненные проекты, например.

Для некоторых блоков может быть использован не класс, а id. Для этого блок должен быть вверху иерархии html и, обязательно, одним на странице. Это может быть `#header`, `#footer`, `#modal`. Если есть сомнения, использовать ли id или class, то лучше использовать class.

Для вложенных **элементов** блоков можно использовать более простые названия классов: `.item`, `.descr`, если они требуются. Важно помнить, что в глобальной видимости такие простые селекторы не допустимы.

```Css
/* Good */
.main-nav { ... }
.main-nav .item { ... }

/* Bad */
.item { ... }

/* OK */
.product-item { .. }
```

В глобальной видимости допустим только один тип некаскадных селекторов - **хэлперы** (helpers). К ним можно отнести такие селекторы, как `.pull-left`, `.text-center`, `.centered`. Хэлперы объявляются до начала основных стилей. При добавлении нового хэлпера, добавляющий несёт ответственность за то, чтобы он не переопределил уже существующие стили. Вообще крайне не рекомендуется использовать хэлперы вообще. Но они могут сыграть хорошую службу при прототипировании.

Если требуется использовать уже существующий блок, но с изменениями, то следует использовать **модификатор** - класс для этого элемента, который переопределит некоторые его свойства.


```Css
/* Навигация в шапке */
.site-nav { float: right; }
.site-nav .item { display: inline-block; }
.site-nav .item a {
  text-decoration: none;
  text-transform: uppercase;
  color: red; }

/* Навигация в подвале с классом-модификатором 'in-footer' */
.site-nav.in-footer { float: none; } 
.site-nav.in-footer .item { display: block; margin-bottom: 2x; }
  /* стили для ссылки остаются те же самые - в модификации не нуждаются */
```

Следует избегать слишком длинных каскадов в селекторах. Оптимальной длинной каскада будет от одного до трёх частей:

```Css
/* Good */
.products .product-tile p { ... }

/* Bad */
.products ul .product-tile p a span { ... }
```


Code
----

* ident by 2 spaces

* Remove trailing white spaces

* Use valid CSS where possible

* use `-` as words devorser in classes and ids

        /* bad */
        .units_list { ... }
        .unitsList { ... }

        /* better */
        .unitslist { ... }

        /* good */ 
        .units-list { ... }

* Use only lowercase

* Elements that occur exactly once inside a page can use IDs, otherwise, use classes. When in doubt, use a class name.
    - Good candidates for ids: header, footer, wrap, modal popups
    - Bad candidates for ids: navigation, item listings, item view pages (ex: issue view)

* ID selector must be on the start of rule

        /* Bad */
        .main-nav #pointer { ... }
        #header .search #quicksearch { ... }

        /* Good */
        #quicksearch { ... }

* Use ID and class names that are as short as possible but as long as necessary

        /* Not recommended */
        #navigation {}
        .atr {}

        /* Recommended */
        #nav {}
        .author {}

* Avoid qualifying ID and class names with type selectors
  
        /* Not recommended */
        ul#example {}
        div.error {}

        /* Recommended */
        #example {}
        .error {}

* Use shorthand properties where possible

        /* Not recommended */
        border-top-style: none;
        font-family: palatino, georgia, serif;
        font-size: 100%;
        line-height: 1.6;
        padding-bottom: 2em;
        padding-left: 1em;
        padding-right: 1em;
        padding-top: 0;

        /* Recommended */
        border-top: 0;
        font: 100%/1.6 palatino, georgia, serif;
        padding: 0 1em 2em;

* Omit unit specification after “0” values

        /* Not recommended */
        margin: 0px;

        /* Recommended */
        margin: 0;

* Use hex color codes `#000` unless using rgba instead case when you need to set opacity for color

* Use 3 character hexadecimal notation where possible

        /* Not recommended */
        color: #eebbcc;

        /* Recommended */
        color: #ebc;

* Use a space after a property name’s colon

        /* Bad */
        h3 {
          font-weight:bold;
        }

        /* Good */
        h3 {
          font-weight: bold;
        }

* Use a space between the last selector and the declaration block

        /* Not recommended: missing space */
        #video{
          margin-top: 1em;
        }

        /* Not recommended: unnecessary line break */
        #video
        {
          margin-top: 1em;
        }
        /* Recommended */
        #video {
          margin-top: 1em;
        }

* Avoid user agent detection as well as CSS “hacks”—try a different approach first


Properties sort order
---------------------

### Substance

* display


### Position

* position
* top, right, bottom, left
* z-index


### Display

* visibility
* float
* clear
* overflow
* clip
* zoom
* flex-*


### Size & Borders

* box-sizing
* margin
* border
* padding
* width
* min-width
* max-width
* height
* min-height
* max-height


### Specific formatting

* table-layout
* empty-cells
* caption-side
* border-spacing
* border-collapse
* list-style
* list-style-position
* list-style-type
* list-style-image
* content
* quotes
* counter-reset
* counter-increment
* resize


### Modifications

* opacity
* transition
* transform
* animation
* border-*
* border-radius
* border-image
* outline
* background
* box-shadow


### Text

* text-[align, decoration, emphasis, indent, justify, transform, outline, wrap, overflow, shadow]
* vertical-align
* white-space
* letter-spacing
* word-spacing
* word-wrap
* word-break
* tab-size
* hyphens
* pointer-events
* font
* line-height
* font-*


### Color, cursor and selection

* color
* cursor
* user-select


Used materials
--------------

* [Github CSS styleguide](https://github.com/styleguide/css)

* [Google Google HTML/CSS Style Guide](http://google-styleguide.googlecode.com/svn/trunk/htmlcssguide.xml)

* [Principles of writing consistent, idiomatic CSS by Nicolas Gallagher](https://github.com/necolas/idiomatic-css/)

* [CSS Guidelines by Harry Roberts](http://cssguidelin.es/)

* You can find more at [CSS Style Guides on CSS-TRICKS](http://css-tricks.com/css-style-guides/)
