---
title: Using namespaced components in React
date: 2015-08-13
author: Narinda Reeders
tags: react, javascript
---

The last time I used React we had some pretty awkward workarounds for the fact that components couldn't be namespaced. I was pretty stoked to find this has been fixed now.

So if you have a component `myNavComponent` you can do:
```js
var NavComponent = React.createClass(...);
```

Define your sub-components as attributes:
```js
NavComponent.Next = React.createClass(...);
NavComponent.Prev = React.createClass(...);
NavComponent.Goto = React.createClass(...);
```
```js
var Nav = NavComponent;
```

And then use them as you would expect to in your JSX:
```jsx
<Nav>
  <Nav.Prev />
  <Nav.Goto />
  <Nav.Next />
</Nav>
```

https://facebook.github.io/react/docs/jsx-in-depth.html#namespaced-components
