---
title: Detect Google Analytics blocking
date: 2016-06-30
author: Max Wheeler
tags: analytics, javascript
---

In a world filled with ad blockers, you can’t rely on Google Analytics dependencies being available when you want to use them. We hit upon this problem when doing some outbound link tracking like so:

```js
function trackOutboundLink (e, url) {
  e.preventDefault()
  ga('send', 'event', 'outbound', 'click', url, {
    'transport': 'beacon',
    'hitCallback': function() {
      document.location = url
    }
  })
}
```

If Google Analytics is blocked, this function would fail to log the outbound click and worse, it’d also stop the link from being followed at all. We can adjust to handle this more gracefully however:

```js
function trackOutboundLink (e, url) {
  if (window.ga && window.ga.create) {
    e.preventDefault();
    ga('send', 'event', 'outbound', 'click', url, {
      'transport': 'beacon',
      'hitCallback': function() {
        document.location = url;
      }
    });
  }
}
```

By checking for both `window.ga` _and_ `window.ga.create` before calling `preventDefault` we ensure that the links work when Google Analytics is blocked, and that outbound clicks are tracked whenever we can.
