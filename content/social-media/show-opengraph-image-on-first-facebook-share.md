---
title: Show Open Graph image on first Facebook share
date: 2015-09-02
author: Max Wheeler
---

When you share a URL on Facebook for the first time — specifically, the first time _anyone_ has shared it — it won’t include any of the images on the page and our clients will be :cry:. This happens even if you have included a meta tag that references an image:

```html
<meta property="og:image" content="http://foo.com/image.png">
```

The _second_ time a URL is shared, it’ll work as expected and your chosen `og:image` will show up in the share preview (along with any other images on the page) — Facebook seem to have shifted this all to a background job or something.

Fear not! There is a solution. If you include the dimensions of your image alongside the `og:image` meta tag it’ll force Facebook to show the image immediately:

```html
<meta property="og:image" content="http://foo.com/image.png">
<meta property="og:image:width" content="300">
<meta property="og:image:height" content="400">
```

These dimensions don’t actually have to be accurate either. On Readings we don’t know the dimensions of images as they’re provided by Erudite without any meta-information, so we do a best-guess approach based on the ratio that book covers (or CD covers) tend to be.
