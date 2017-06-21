# s3vault
Amazon S3 Bucket File Browser

## Requirements
* Apache HTTPD with mod_rewrite
* [Lucee](http://lucee.org/downloads.html) (recommended) or Adobe ColdFusion

## Setup
* copy files to domain root or a subfolder
* modify s3.conf.json to have at least one S3 Bucket configured and also put in AWS credentials
### Example bucket
```javascript
{
  "id" : "library", 
  "name" : "my-library-s3-bucket",
  "label" : "Library",
  "root" : "s3:///my-library-s3-bucket",
  "website" : "http://my-library-s3-bucket.s3-website.eu-central-1.amazonaws.com"
}
```
## AWS notes
* don't use your master accessKeyID/awsSecretKey, instead create user with read-only access to selected buckets
* for buckets connected to S3 Vault, create a bucket policies that grant anonymous user to read (download) files directly from S3. See example on [Amazon AWS website](http://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-2).
### Example policy: anonymous user to read object (file) from S3 bucket
```javascript
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::examplebucket/*"]
    }
  ]
}
```
* for buckets connected to S3 Vault, turn on "Static website hosting" feature. This will allow open/download files using direct, nice looking URL. Read more about static website hosting on [Amazon AWS website](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html).

![Amazon S3 Static Website Feature](https://s3.amazonaws.com/rodionbykov/2017/aws-s3-bucket-static-website-hosting-feature.png "Amazon S3 Static Website Feature")
