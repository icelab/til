---
title: Dynamic classnames in Slim
date: 2015-08-12
author: Max Wheeler
---

While glancing through one of Narinda’s pull-requests, I noticed she’d used a syntax for dynamic classnames in [Slim](http://slim-lang.com/) that I had not seen before:

```slim
# Aww yeah
- dynamic_classname = (truthy_test ? 'foo' : 'bar')
.static-class-name-one class=["static-class-name-two", dynamic_classname]
  ' Foo or bar?
```

Slim will magically convert concatenate the classnames based on the truthiness of the `truthy_test`. Much more flexible (and less stinky) than the string concatenation I would usually use:

```slim
# Eww
- dynamic_classname = (truthy_test ? 'foo' : 'bar')
.static-class-name-one class="static-class-name-two #{dynamic_classname}"
  ' Foo or bar?
```
