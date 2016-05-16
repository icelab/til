---
title: Using CloudFront as ‘origin pull’ (with bonus gzip)
date: 2016-02-16
author: Max Wheeler
tags: performance, aws
---

CloudFront can act as a CDN that ‘pulls’ content from an origin server. It’s really easy to set up, you simply set the ‘Origin Domain Name’ to wherever you’re hosting your app: `foobar.herokuapp.com` for example and then ... nothing. That’s all you need to do. Requests that come through CloudFront will pass through to your origin server and then be cached thereafter.

For bonus points it’ll also gzip your content for you without you having to do much work at all. Set ‘Compress Objects Automatically’ to ‘Yes’ and you’re done. If CloudFront can serve a gzipped version (and the client can receive one) it’ll serve up a compressed version of your file instead.
