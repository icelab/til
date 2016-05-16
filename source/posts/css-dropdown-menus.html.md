---
title: CSS dropdown menus
date: 2015-08-17
author: Andy McCray
tags: css
---

Creating a CSS-only dropdown menu is easy!

![CSS dropdown menus are the bomb](images/css-dropdown-menus.gif)

Using nested lists, the basic structure is:

```slim
ul.nav
  li.nav__list-item
    a.nav__list-anchor href="#"
      | Hogwarts
  li.nav__list-item.nav__list-item--has-dropdown
    span.nav__list-toggle
      | Students
      i.fa.fa-caret-down
    ul.nav__dropdown
      li.nav__dropdown-list-item
        a.nav__dropdown-list-anchor href="#"
          | Harry Potter
      li.nav__dropdown-list-item
        a.nav__dropdown-list-anchor href="#"
          | Ron Weasley
      li.nav__dropdown-list-item
        a.nav__dropdown-list-anchor href="#"
          | Hermione Granger
  li.nav__list-item.nav__list-item--has-dropdown
    span.nav__list-toggle
      | Teachers
      i.fa.fa-caret-down
    ul.nav__dropdown
      li.nav__dropdown-list-item
        a.nav__dropdown-list-anchor href="#"
          | Minerva McGonagall
      li.nav__dropdown-list-item
        a.nav__dropdown-list-anchor href="#"
          | Severus Snape
```

And the bare-bones CSS:

```css
.nav__list-item {
  display: inline-block;
  position: relative;
}

  .nav__list-anchor,
  .nav__list-toggle {
    cursor: pointer;
    display: block;
  }

    .nav__dropdown {
      display: none;
      position: absolute;
      z-index: 2;
    }
    .nav__list-item--has-dropdown:hover .nav__dropdown,
    .nav__list-item--has-dropdown:focus .nav__dropdown {
      display: block;
    }

      .nav__dropdown-list-anchor {
        display: block;
      }
```

## Consider mobile

`:hover` triggered menus don't feel _great_ on mobile. A nice solution is to use a JavaScript `click` event to append a modifier class to the the toggle element (`.nav__list-anchor--dropdown-is-visible`) and use that class to perma-show the menu.
