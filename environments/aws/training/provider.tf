provider "aws" {
    # provider parameters here. Override any secrets at run time and avoid storing them in source control
    # access_key = ""
    # secret_key = ""
    region = "${var.region}"
    profile = "default"
}
