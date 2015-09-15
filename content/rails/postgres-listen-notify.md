---
title: PostgreSQL as a message bus
date: 2015-09-15
author: Alex Timofeev
---

PostgreSQL has its own listen/notify mechanism. It might be useful for cases, when we have to manage messaging between different workers of application, but would prefer to not use extra dependencies such as Redis.

```
CHANNEL       = "slack_bot"
RESET_CHANNEL = "pg_restart"

ActiveRecord::Base.connection_pool.with_connection do |connection|
  conn = connection.instance_variable_get(:@connection)
  begin
    conn.async_exec "LISTEN #{RESET_CHANNEL}"
    conn.async_exec "LISTEN #{CHANNEL}"
    catch(:break_loop) do
      loop do
        conn.wait_for_notify do |channel, pid, payload|
          p [channel, payload]
          throw :break_loop if channel == RESET_CHANNEL
        end
      end
    end
  rescue => error
    p [:error, error]
  ensure
    conn.async_exec "UNLISTEN *"
  end
end
```

```
User.connection.execute %Q(NOTIFY "slack_messages", params)
```
