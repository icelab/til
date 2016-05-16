---
title: Creating an IAM user for access to an S3 bucket
date: 2016-04-04
author: Tim Riley
tags: aws
---

When you create an S3 bucket for a web app to use, you should create a specific IAM user to grant access to that bucket.

To do this, first create a user:

1. Visit the [IAM section of the AWS console](https://console.aws.amazon.com/iam)
2. Go to the "Users" section and click the "Create New Users" button
3. Enter the user name(s) you want to create (e.g. `my-bucket-s3` for a bucket named `my-bucket`)
4. When you're shown the user credentials, save them somewhere safe, like our team 1Password vault
5. When you return to the IAM users list, go to the newly created user and click on their "Permissions" tab. Click on the "Inline Policies" section and create a new policy
6. Choose to create a "Custom Policy"
7. Name the policy "my-bucket-s3-access" (or something similarly descriptive) and paste the following into the "Policy Document" area (replacing `my-bucket` with your bucket's name):

    ```json
    {
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "s3:ListAllMyBuckets",
          "Resource": "arn:aws:s3:::*"
        },
        {
          "Effect": "Allow",
          "Action": "s3:*",
          "Resource": [
            "arn:aws:s3:::my-bucket",
            "arn:aws:s3:::my-bucket/*"
          ]
        }
      ]
    }
    ```
8. Click "Apply Policy"

The access policy should now be active and your app should be able to access the bucket with the new IAM user's credentials.
