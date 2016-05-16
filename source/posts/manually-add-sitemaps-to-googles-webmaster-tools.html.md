---
title: Manually add sitemaps to Google’s Webmaster Tools
date: 2015-09-15
author: Max Wheeler
tags: seo
---

It’s good practice to add sitemaps to [Google’s Webmaster Tools](https://www.google.com/webmasters/tools/) so you can check their health and get notifications about sitemap issues. We often host sitemaps on S3 because they could be large static files that we don’t want running through our Rails stack.

This leads us to the problem: If you have a sitemap that’s hosted externally to your website, you can’t add them through the Google’s Webmaster Tools interface. For some reason Google limits these to paths underneath the official domain attached to an account. There is a solution though — you can sneak them in using their notification URL. All you need to do is:

```
curl www.google.com/webmasters/tools/ping?sitemap=https%3A%2F%2Fwheeler-centre-heracles.s3.amazonaws.com%2Fsitemaps%2Fsitemap.xml.gz
```

And ta da, it’ll show up in the Webmaster Tools admin interface.
