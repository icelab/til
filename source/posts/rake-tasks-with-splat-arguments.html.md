---
title: Rake tasks with splat arguments
date: 2017-05-03
author: Tim Riley
tags: ruby, rake
---

Splat arguments can be helpful, and it turns out we don't need to forsake them when we're building Rake tasks, either.

Let's say we want to build an `elasticsearch:reindex` task that allows an optional list of entity types to reindex:

```ruby
namespace :elasticsearch do
  task :reindex do |_t, args|
    Search::Container["search.operations.enqueue_reindex"].(*args.extras)
  end
end
```

Rake gives us a [`TaskArguments#extras`](http://www.rubydoc.info/gems/rake/Rake/TaskArguments#extras-instance_method) method, which returns  the values not associated with any of the task's named arguments.

So now we can call our rake task like so:

```
rake elasticsearch:reindex[products, posts]
```

And `args.extras` gives us this:

```ruby
["products", "posts"]
```
