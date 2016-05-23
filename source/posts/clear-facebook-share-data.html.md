---
title: Facebook image display when posting a link
date: 2015-08-20
author: Jess Allison
tags: social
---


When sharing links to Facebook, ████████ were only being given the option to display old images, and couldn’t work out why the new ones weren’t coming through.

As it happens, there are specific metatags required to force Facebook to notice the correct content, explained [here](https://developers.facebook.com/docs/sharing/webmasters#markup).

“Without these tags, the Facebook Crawler will use internal heuristics to make a best guess about the title, description, and preview image for your content.”

To force refresh of a particular item without updating the site itself, you can also use the [Facebook debugger](https://developers.facebook.com/tools/debug/og/object/).

If you go there, input the URL and click “Fetch new scrape information” until the “right” content shows up at the bottom.
