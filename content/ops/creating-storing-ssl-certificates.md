---
title: Creating and storing SSL certificates
date: 2016-05-04
author: Josephine Hall
---

As part of the SSL Certificate generation process you'll need to create a Certificate Signing Request. You can do this with the command:

```
openssl req -nodes -newkey rsa:2048 -sha256 -keyout server.key -out server.csr
```

This will generate two files: a public .csr file, and a private .key file

You can view the files with the commands `cat server.csr` and `cat server.key`

To save this information for future use we now recommend making a new 1Password secure note named in the following format:

```
[domain-name.com] SSL CSR
```

Save the data from both files into the secure note and continue to be happy and confident in the face of adversity :)

