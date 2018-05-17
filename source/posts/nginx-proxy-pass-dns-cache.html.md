---
title: NGINX proxy_pass DNS caching and Heroku
date: 2018-05-17
author: Max Wheeler
tags: ops, nginx, heroku
---

We occasionally use NGINX to `proxy_pass` to an app on Heroku so that we have a consistent IP address that can be whitelisted in clients’ firewalls. There’s a quirk in the way that NGINX caches DNS lookups that can cause problems when proxying to Heroku.

By default, NGINX will cache the DNS result (the resolved IP address) for any _statically defined_ URLs for `proxy_pass` on startup. This is problematic on Heroku because the IP address for the underlying app changes continuously, and so it a cached result falls out of Heroku’s routing mesh we can proxy to the incorrect server.

The solution to this problem is to avoid caching the DNS resolution, at least as much as is possible. [You can "trick" NGINX into doing this by setting the `proxy_pass` value to a variable](https://www.nadeau.tv/nginx-proxy_pass-dns-cache/):

```
server {
  resolver 8.8.8.8;
  # Set as a variable to force dynamic lookups
  set $proxy_pass_url https://my-app.herokuapp.com;

  location / {
    proxy_pass $proxy_pass_url;
  }
}
```

Even though the value of the variable never changes, NGINX thinks it _might_ and thus will refresh it regularly.