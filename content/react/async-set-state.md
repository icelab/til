---
title: In React setState is not "guaranteed" to be synchronous.
date: 2015-11-19
author: Narinda Reeders
---

I discovered recently that if you do something link this in react:

```javascript
this.setState(reallyUseful: true);

if (this.state.reallyUseful) {
  this.doSomethingAmazing();
}
```

... it's not very useful and more often than not nothing amazing happens, just confusion and sadness.

This is because `setState` it turns out, is asynchronous. Of course most of the time you are doing your amazing things in your render function so everything is sweet but on the odd occasion that you need to pass that value elsewhere, eg: publishing an event, beware!

From the docs:

> setState() does not immediately mutate this.state but creates a pending state transition. Accessing this.state after calling this method can potentially return the existing value.
> There is no guarantee of synchronous operation of calls to setState and calls may be batched for performance gains.

Read about `setState` here: https://facebook.github.io/react/docs/component-api.html