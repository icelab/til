---
title: Using `Class.new` for dynamically adding class methods
date: 2015-08-09
author: Tim Riley
tags: ruby
---

Say you're building a system where you want to dynamically add some class methods to a class at a particular moment, but without leaving them around for use on the class at other times.

This is pretty easy if you create an anonymous subclass whenever you need to use the special class methods:

```ruby
module MyCustomFinders
  def special_finder
    where(something: "is special")
  end
end

class MyThing < ActiveRecord::Base
end

Class.new(MyThing).extend(MyCustomFinders).special_finder
```
