---
title: Setting cookies in request specs
date: 2015-09-17
author: Narinda Reeders
---

When writing request specs and you want to set a cookie, setting it with Capybara doesn’t seem to work, best to set it in the request headers.

Sad panda:
`Capybara.current_session.driver.browser.set_cookie("really_useful_cookie=#{cookie_monster.id}")`

Happy panda:
`get some_path, {}, {“HTTP_COOKIE” => "really_useful_cookie=#{cookie_monster.id}”}`
