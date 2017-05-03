---
title: `background-position` precision with the `calc` property
date: 2017-02-09
author: Andy McCray
tags: css
---

Positioning a `background-image` with CSS can be a frustrating experience. In fixed layout contexts you can use pixel or percentage values for precision positioning, but when you‘re working with a fluid layout, this can be a real headache.

Let‘s start by reviewing the `background-position` property:

```css
.element {
  background-position: xpos ypos;
}
```

In most cases, this will be a fixed unit (`20px 30px`), a percentage (`50% 100%`), some keywords (`left top`) or a combination thereof (`right 20%`).

So what can you do if you want to position an image `40px` from the right edge of your fluid-width container? Our favourite `calc` property to the rescue!

```css
.element {
  /* Position the background at the right edge, then offset it by `40px` */
  background-position: calc(100% - 40px) top;
}
```
