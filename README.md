# meteor-boilerplate

A starting point for meteorjs applications, includes Iron Router, Bootstrap 3, Font Awesome, SCSS and Coffeescript.

## What's included

* File Structure
* <a href="http://coffeescript.org/" target="_blank">Coffeescript</a>
* <a href="http://sass-lang.org/" target="_blank">SCSS</a>
* <a href="https://github.com/EventedMind/iron-router" target="_blank">Iron Router</a>
* <a href="http://github.differential.io/accounts-entry" target="_blank">Accounts-Entry</a>
* <a href="http://getbootstrap.com" target="_blank">Bootstrap 3.1.1</a>
* <a href="http://fontawesome.io/" target="_blank">Font Awesome 4.1.0</a>

## Installation

Make sure you have Meteor and [Meteorite](https://github.com/oortcloud/meteorite/) installed, and then clone locally and run with `mrt`

## File structure

We have a common file structure we use across all of our meteorjs apps. The structure keeps view-dependent files together (`.html`, `.scss`, `.coffee`).

```
.meteor
client
  ├── accounts
  ├── compatibility
  ├── router
  └── stylesheets
    └── lib
      ├── bootstrap.css
      └── font-awesome.css
    ├── global.scss
    ├── mixins.scss
    └── variables.scss
  └── views
    └── dashboard
      ├── dashboard.html
      └── dashboard.scss
    └── home
      ├── home.html
      ├── home.scss
      └── home.coffee
    ├── footer.html
    ├── header.html
    ├── index.html
    └── loading.html
collections
  └── user.coffee
packages
public
  ├── fonts
  └── favicon.ico
server
  ├── views
  ├── accounts.coffee
  └── publications.coffee
```

## Responsive SCSS Variables

Includes 4 SCSS variables to make responsive design super easy. Each variable (`xs`, `sm`, `md`, `lg`) coincides with [Bootstrap media queries](http://getbootstrap.com/css/#responsive-utilities).

```

h1 {
  font-size: 24px;

  @media @lg {
    font-size: 36px;
  }
}

```

## Search Engine Optimization

Search engines rely on `<title>` and `<meta>` tags to read page titles and descriptions. You can specify these for each page in your app by including the following in the corresponding page's `.coffee` file. (Sample included in home.coffee)

```CoffeeScript

Tempate.home.rendered = ->

  document.title = "My New Meteor App"
  $("<meta>", { name: "description", content: "Page description for My New Meteor App" }).appendTo "head"

```
