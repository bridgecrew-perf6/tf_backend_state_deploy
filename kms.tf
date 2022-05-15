## KMS key for S3 bucket state

resource "aws_kms_key" "tf-state-bucket-key" {
    description             = "This key is used to encrypt S3 bucket objects"
    deletion_window_in_days = 10
    enable_key_rotation     = true
}

resource "aws_kms_alias" "key-alias" {
    name          = "alias/tf-state-bucket-key"
    target_key_id = aws_kms_key.tf-state-bucket-key.key_id
}