---
title: Setting up Let's Encrypt manually with Heroku
date: 2016-06-23
author: Daniel Nitsikopoulos
tags: heroku, ssl
---

Ideally, this process would be done on the server that is running your website, but that's not always possible.

Let's encrypt has a handy CLI tool called `certbot`. You can get it with homebrew by running:
```bash
$ brew install certbot
```

Once that's installed, we can run the following command to begin the process:
```bash
$ sudo certbot certonly --manual
```

You'll then be prompted to enter the domains for this certificate. Note that if you would like `www.domain.com` and `domain.com` you'll need to enter them both beginning with `domain.com`.

You'll then be asked a few more questions and finally get to a message that asks you to ensure your website responds with a given string when a URL is requested.

You'll need to find a way to make the site respond accordingly. In most cases, it's just a matter of adding a new route if the site is already running.

Once your site responds to the URL required, you can go to the next step. If you added more than one domain in the first step, you will need to repeat the previous steps for each one.

You'll then see a message like: 

> IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at /etc/letsencrypt/live/domain.com/fullchain.pem. Your cert will expire on 2017-06-23. To obtain a new version of the certificate in the future, simply run Let's Encrypt again.

This means the process was a success and all that's left to do is upload the certificate to Heroku.

**If you are adding a new certificate:**
Install the endpoints addon with:
```bash
$ heroku addons:create ssl:endpoint
```
and then add your certificates with:
```bash
$ sudo heroku certs:add /etc/letsencrypt/live/domain.com/fullchain.pem /etc/letsencrypt/live/domain.com/privkey.pem
```

**If you are replacing an existing certificate:**
```bash
$ sudo heroku certs:update /etc/letsencrypt/live/domain.com/fullchain.pem /etc/letsencrypt/live/domain.com/privkey.pem
```
