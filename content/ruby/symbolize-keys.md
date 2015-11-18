---
title: Symbolize-keys
date: 2015-11-19
author: Jojo Hall
---

If you're writing plain old Ruby you can symbolize the keys of a hash with the following:

`hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}`

This does the following:

```
hash = {"hello" => "jojo"}
hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
=> {:hello=>"jojo"}
```

However if you're doing this in a web application you may want to make a module to make hash and array data transformations easily available to you. In most of our apps we would use [transproc](https://github.com/solnic/transproc) to help us with this — if you're working in one of Icelab's Rodakase apps this will be available to you.

```
require "transproc/all"

module Functions
  extend Transproc::Registry

  import Transproc::HashTransformations
  import Transproc::ArrayTransformations

  def self.t(*args)
    self[*args]
  end
end

Functions.t(:symbolize_keys)[{"foo" => "bar"}]
# => {foo: "bar"}
```

If you are using Rails then you can use the method `hash.symbolize_keys` or the destructive version `hash.symbolize_keys!`
In this situation it's ActiveSupport which makes this method available to us, and it's a part of Rails.
