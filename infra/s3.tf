module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket-05042026"

  website = {
    "index_document" : "index.html",
  }

  attach_policy = true
  policy        = data.aws_iam_policy_document.s3-policy-document.json

  block_public_policy = false
  restrict_public_buckets = false

  versioning = {
    enabled = true
  }
}

// Bucket policy 

data "aws_iam_policy_document" "s3-policy-document" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"

    actions = ["s3:GetObject"]

    resources = ["arn:aws:s3:::my-s3-bucket-05042026/*"]
    
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}


output "policy" {
  value = data.aws_iam_policy_document.s3-policy-document.json
}
