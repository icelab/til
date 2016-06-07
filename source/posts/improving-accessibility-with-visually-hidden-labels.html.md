---
title: Improving accessibility with visually hidden labels
date: 2016-06-07
author: Andy McCray
tags: accessibility
---

Accessibility is something that's always in the front of our minds when building websites at Icelab. It's particularly important for Government work which requires specific [WCAG](https://www.w3.org/WAI/intro/wcag) adherence.

A pattern we use often is to _visually hide_ additional descriptive labels. These labels will be announced by screen readers but not rendered on the screen. Take this common snippet:

```slim
ul.social-icons__list
  li.social-icons__list-item
    a.social-icons__anchor href="http://twitter.com/andymccray"
      i.fa.fa-twitter
  li.social-icons__list-item
    a.social-icons__anchor href="mailto:andy@icelab.com.au"
      i.fa.fa-envelope
```

With that we have a nice Twitter bird and envelope icon (courtesy of [Font Awesome](http://fontawesome.io/)). Perfect!

…well, not so perfect really. We can make the experience much nicer for visually impaired users with a little extra effort:

```slim
ul.social-icons__list
  li.social-icons__list-item
    a.social-icons__anchor href="http://twitter.com/andymccray"
      span.hide-visually Follow Andy McCray on Twitter
      i.fa.fa-twitter
  li.social-icons__list-item
    a.social-icons__anchor href="mailto:andy@icelab.com.au"
      span.hide-visually Email Andy McCray
      i.fa.fa-envelope
```

And the CSS:

```css
/*
 * Hide only visually, but have it available for screen readers:
 * http://snook.ca/archives/html_and_css/hiding-content-for-accessibility
 */

.hide-visually {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}
```

And with that our screen reader users will have a much friendlier experience getting in touch.
