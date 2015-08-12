---
title: Formatting strings with C-like formatting codes.
date: 2015-08-12
author: Daniel Nitsikopoulos
---

I learnt this while putting together the report emails for Ticketscout.

Most of the time, regular string interpolation is all that we need when working with strings. Though sometimes we want a little more control without sacrificing brevity or readability. 

Let's say we have a set of numbers that we want to calculate the average for, then print that average to 1 decimal place.

```ruby
FLOATS = [
  42.0,
  36.0,
  28.0,
  19.0,
  27.0,
  18.0,
  10.0
]
avg = FLOATS.reduce(0, :+) / FLOATS.size
"Average is: #{avg}" # => "Average is: 25.714285714285715
"Average is: #{avg.round(1)}" # => "Average is: 25.7
```

Normally, this is fine, but when working with some content, it may be nicer to use Ruby's String Format instead.

```ruby
"Average is %.1f" % avg # => "Average is 25.7"
```

We can also make printing hashes a little prettier as well.

```ruby
dog = {name: 'poppy' ,breed: 'labrador',colour: 'black'}

"This is #{dog[:name]}, she is a #{dog[:colour]} #{dog[:breed]}."
```

Becomes:

```ruby
"This is %{name}, she is a %{colour} %{breed}." % [dog]
```

Which, to me at least, reads a little nicer.
