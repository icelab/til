---
title: URI regular expressions
date: 2016-06-01
author: Daniel Nitsikopoulos
tags: regex, ruby
---

Let's go ahead and write some regex to validate a URI in Ruby:

![Good Grief](https://vignette3.wikia.nocookie.net/arresteddevelopment/images/e/ef/2x04_Good_Grief_%2832%29.png/revision/latest/scale-to-width-down/640?cb=20121126044547)

```ruby
URI.regexp
```

That's it!

We can use it like so

```ruby
URI.regexp.match(my_uri)
```

If you have a look at the output of `URI.regexp` in `irb`, you'll see the pattern that's used to match against. It's relatively complex, but each capture group is documented.

1. Scheme
2. Opaque (e.g. scheme:foo/bar)
3. User Info
4. Host
5. Port
6. Registry
7. Path
8. Query
9. Fragment

```ruby
irb(main):001:0> URI.regexp.match("http://username:password@foo.bar:80/baz.html?query=string#fragment")
=> #<MatchData "http://username:password@foo.bar:80/baz.html?query=string#frag" 1:"http" 2:nil 3:"username:password" 4:"foo.bar" 5:"80" 6:nil 7:"/baz.html" 8:"query=string" 9:"frag">
```
