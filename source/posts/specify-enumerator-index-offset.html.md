---
title: Specify enumerator index offset
date: 2016-06-09
author: Daniel Nitsikopoulos
tags: ruby
---

When looping through a collection of items, we sometimes want access to the index of an item at each iteration.

We can do that with `collection.each_with_index{ |item, index| ... }`.

In this case, `index` will always start at `0`. 

If we want index to start from a particular number, we can use `Enumerator#with_index` and specify an offset.

For example: `collection.each.with_index(1){ |item, index| ... }`.

[Enumerator#with_index](http://ruby-doc.org/core-2.1.0/Enumerator.html#method-i-with_index)
