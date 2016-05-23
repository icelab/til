---
title: Hash.new with a block works well as a keyed cache
date: 2016-05-23
author: Tim Riley
tags: ruby
---

We're all familiar with the `@foo ||= expensive_computation` technique to memoize (i.e. cache) the output of slow computations or to avoid unnecessary object creation.

If you want to do the same but with results that will vary by a single parameter, you can use Ruby's hash with it's [block-based initializer](http://ruby-doc.org/core-2.3.1/Hash.html#method-c-new) to handle the caching for you:

```ruby
def my_cache
  @my_cache ||= Hash.new do |hash, key|
    hash[key] = some_slow_computation(key)
  end
end

# Computed once
my_cache[:foo]

# Then cached
my_cache[:foo]
```

You can see this work in practice [inside dry-component's Injector](https://github.com/dry-rb/dry-component/blob/0bebc656b625a18c25e3c8d9c4b71946fecac5e1/lib/dry/component/injector.rb#L56-L60), where it caches objects to allow arbitrarily long chaining of injector strategies without creating duplicate injector objects.
