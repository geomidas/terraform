#resource "aws_s3_bucket" "tf_bucket_public" {
#  bucket = "tf-bucket-2"
#  acl    = "public-read"
#  policy = "${file("bucket_public_policy.json")}"
#}