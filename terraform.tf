# terraform {
#     backend "s3" {
#         bucket         = "NAME_OF_THE_TF_STATE_BUCKET"  # this bucket name needs to be hardcoded as backend configuration does not support variable references
#         key            = "state/terraform.tfstate"
#         region         = "eu-west-1"
#         encrypt        = true
#         kms_key_id     = "alias/tf-state-bucket-key"
#         dynamodb_table = "terraform-state"
#     }
# }
