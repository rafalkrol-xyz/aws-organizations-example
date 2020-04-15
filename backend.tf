resource "aws_s3_bucket" "aws-organizations-example" {
  bucket = "aws-organizations-example"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix                                 = "terraform/"
    enabled                                = true
    abort_incomplete_multipart_upload_days = 7

    expiration {
      expired_object_delete_marker = true
    }

    transition {
      days          = 7
      storage_class = "INTELLIGENT_TIERING"
    }

    noncurrent_version_expiration {
      days = 60
    }
  }
}

resource "aws_s3_bucket_public_access_block" "aws-organizations-example" {
  bucket = aws_s3_bucket.aws-organizations-example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

terraform {
  backend "s3" {
    bucket = "aws-organizations-example"
    key    = "terraform/terraform.tfstate"
    region = "eu-west-1"
  }
}
