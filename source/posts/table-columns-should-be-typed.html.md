---
title: Table columns should be typed
date: 2015-08-13
author: Michael Honey
tags: processing
---

Processing.Table columns should be typed as INT or FLOAT if you want to do maths with them:

```java
table.addColumn("name"); // defaults to STRING
table.addColumn("count", Table.INT);
table.addColumn("height", Table.FLOAT);
```

If you _don't_ do that, trying to cast the value on the way out:

```java
inst.getFloat("total")+1);
```

Seems like it'd work. Nope.

(Processing 2.2.1)
