---
title: Selecting colours in HTML
date: 2016-05-22
author: Max Wheeler
tags: html
---

Somehow in the excitement around HTML5’s new input types I missed the addition of an input type specifically for selecting colours:

```html
<input type="color">
```

Include this and you’ll get a platform-native colour selector that takes and returns hex colour values, like my debugging colour of choice `#ff0099`:

<p data-height="200" data-theme-id="0" data-slug-hash="vGogBW" data-default-tab="result" data-user="makenosound" data-embed-version="2" class="codepen">Selecting colours in HTML <a href="http://codepen.io/makenosound/pen/vGogBW/">vGogBW</a></p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>

Note that the value needs to a fully hex string, not a shortcut like `#f09`.
