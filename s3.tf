## S3 bucket state

resource "aws_s3_bucket" "tf-state" {
    bucket_prefix = "tf-state"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf-state-sever-side-encryption" {
    bucket = aws_s3_bucket.tf-state.id

    rule {
        apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.tf-state-bucket-key.arn
        sse_algorithm     = "aws:kms"
        }
    }
}

resource "aws_s3_bucket_acl" "tf_state_bucket_acl" {
  bucket = aws_s3_bucket.tf-state.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tf-state-versioning" {
  bucket = aws_s3_bucket.tf-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
    bucket = aws_s3_bucket.tf-state.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}