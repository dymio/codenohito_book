CSS Style Guide
===============

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

* Elements that occur exactly once inside a page should use IDs, otherwise, use classes. When in doubt, use a class name
    - Good candidates for ids: header, footer, slider, modal popups
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

        /* Not recommended */
        h3 {
          font-weight:bold;
        }

        /* Recommended */
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

* line-height
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
* font-*


### Color, cursor and selection

* color
* cursor
* user-select
