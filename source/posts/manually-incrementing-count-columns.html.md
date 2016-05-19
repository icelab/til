---
title: Manually incrementing count columns in rails
date: 2015-09-18
author: Daniel Nitsikopoulos
tags: rails, ruby
---

Adding a counter cache column to a model is a common optimisation we make in order to avoid unnecessary queries when trying to aggregate data associated with that particular model. Rails provides us with a number of ways to maintain the counter cache column's value. The first is to follow the rails convention and add `counter_cache: true` to a `belongs_to` association and ensure we have a correctly named `*_count` column.

The other way to do it, is manually. In this case rails provides us with a few convenience methods to increment a given column.

The first is `ActiveRecord::Base#increment!(attribute, by)`.

`increment!` is defined as:

```ruby
def increment!(attribute, by = 1)
  increment(attribute, by).update_attribute(attribute, self[attribute])
end
```

and `increment` is defined as:

```ruby
def increment(attribute, by = 1)
  self[attribute] ||= 0
  self[attribute] += by
  self
end
```

Which means that we're first fetching the current attribute's value, incrementing it then passing it on to `update_attribute` before it can be saved. This method leads to a non-atomic database operation, that is to say that at one point, the count is different in memory than it is in the database (which can lead to race conditions).

The second is `ActiveRecord::Base#increment_counter(column_name, record_id)`

`increment_counter` is defined as:

```ruby
def increment_counter(counter_name, id)
  update_counters(id, counter_name => 1)
end
```

which executes SQL like:

```SQL
UPDATE "table_name"
  SET "counter_name" = "counter_name" + 1
  WHERE id = 1
```

This means that we now have an atomic operation and the counter cache value is the same across the system.

Docs:
* [increment!](http://apidock.com/rails/ActiveRecord/Base/increment!)
* [increment_counter](http://apidock.com/rails/ActiveRecord/Base/increment_counter/class)
