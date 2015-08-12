---
title: Displaying booleans in Active Admin
date: 2015-08-13
author: Josephine Hall
---

In Active Admin if you want to display a boolean propetry that doesn't directly map to a database column you can use `status_tag` to display the value in a fiendly way:

```
column :featured do |thing|
  thing.featured? ? status_tag( "yes", :ok ) : status_tag( "no" )
end
```
