---
title: Authenticating with AWS Elasticsearch
date: 2015-10-21
author: Andrew Croome
---

The AWS Elasticseach service offers authentication via an IAM user, or by whitelisting IPs.

Here's how to use IAM credentials to sign requests to the service when using Faraday and how to hook that into the Ruby elasticsearch gem.

To sign requests using Faraday, you can use a gem called [faraday_middleware-aws-signers-v4](https://github.com/winebarrel/faraday_middleware-aws-signers-v4), which provides a middleware that will sign your requests.

```ruby
require 'faraday_middleware'
require 'faraday_middleware/aws_signers_v4'

conn = Faraday.new(url: 'address-of-your-AWS-es-service') do |faraday|
  faraday.request :aws_signers_v4, {
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
    service_name: 'es',
    region: 'ap-southeast-2'
  }

  faraday.adapter :typhoeus
end
```

To get the client provided by the elasticsearch gem to use your Faraday configuation, you can pass that configuration to it like so:

```ruby
faraday_config = lambda do |faraday|
  faraday.request :aws_signers_v4, {
    credentials: Aws::Credentials.new(
      ENV["ELASTICSEARCH_AWS_ACCESS_KEY_ID"],
      ENV["ELASTICSEARCH_AWS_SECRET_ACCESS_KEY"]
      ),
      service_name: "es",
      region: ENV["ELASTICSEARCH_AWS_REGION"]
    }
    faraday.adapter :typhoeus
  end

elasticsearch_host_config = {
  host:   ENV["ELASTICSEARCH_HOST"],
  port:   ENV["ELASTICSEARCH_PORT"],
  scheme: ENV["ELASTICSEARCH_SCHEME"]
}
  
transport = Elasticsearch::Transport::Transport::HTTP::Faraday.new(hosts: [elasticsearch_host_config], &faraday_config)

client = Elasticsearch::Client.new(transport: transport)
```

You can then use the client object as usual, and you'll get automatically signed requests.

