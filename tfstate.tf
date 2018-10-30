terraform {
    backend "s3" {
        bucket = "bucket-training-mlozano-us-east-1-mlozano"
        key    = "terraform-remote-state/training/terraform.tfstate"
        region = "us-east-1"
    }
}
