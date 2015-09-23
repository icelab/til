---
title: Using Arel to compare attributes of a record
date: 2015-09-24
author: Daniel Nitsikopoulos
---

I was just trying to find a way to run a query and compare the `updated_at` and `created_at` attributes of a record and came across this technique:

```ruby
users = User.arel_table
User.where(users[:created_at].eq(users[:updated_at]))
```

It seems like `.gt` and `.lt` also work. While `User.where("created_at = updated_at")` would also work in SQL, we can use Arel to be database agnostic.


_[Arel docs](https://github.com/rails/arel)_
