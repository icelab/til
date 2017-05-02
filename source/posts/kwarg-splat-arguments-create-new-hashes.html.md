---
title: Kwarg splat arguments create new hashes
date: 2017-05-03
author: Tim Rilety
tags: ruby
---

I made a method with a "double splat" kwarg argument to accept some options and returned a modified hash:

```ruby
def singularize_options(**options)
  options = options.dup

  # mutate `options` here...

  options
end
```

In my usual "don't mutate things we don't own" style, I `#dup`ed the incoming options before going to work on it.

However, [thanks to our dry-rb/rom-rb friend @flash-gordon](https://github.com/dry-rb/dry-view/pull/36/files#r114222945), I learnt this wasn't necessary! As he says:

> when you capture values with `**`, Ruby creates a new hash instance so calling `.dup` is not needed

```ruby
def foo(**options)
  options.object_id
end

{}.tap { |h| puts foo(h) == h.object_id }
# => false
```

Now my method can be even simpler:

```ruby
def singularize_options(**options)
  # mutate `options` here...
  options
end
```
