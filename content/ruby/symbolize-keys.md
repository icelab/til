---
title: Symbolize-keys
date: 2015-11-19
author: Jojo Hall
---

If you're not in Rails-land, you can symbolize the keys of a hash with the following:

`hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}`

This does the following:

```
hash = {"hello" => "jojo"}
hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
=> {:hello=>"jojo"}
```

If you are using Rails then you can use the method `hash.symbolize_keys` or the destructive version `hash.symbolize_keys!`
