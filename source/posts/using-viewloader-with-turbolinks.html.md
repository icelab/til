---
title: Using viewloader with turbolinks
date: 2015-09-17
author: Andrew Croome
tags: javascript
---

When using viewloader with turbolinks, you want to make sure that viewloader executes once on the initial page load, once when the visitor reaches another page, and once when the visitor goes back in their browser (or forward for that matter).

To achieve this, get viewloader to execute on the `ready`, `page:load` and `page:restore` events:

```javascript
$(document).on("ready page:load page:restore", function() {
  viewloader.execute(views);
});
```

`page:restore` is fired by [turbolinks](https://github.com/rails/turbolinks) whenever "A cached body element has been loaded into the DOM".
