module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket-05042026"
  
  website = {
    "index_document": "index.html",
  }

  attach_public_policy = true
  restrict_public_buckets = false

   versioning = {
    enabled = true
  }
}
