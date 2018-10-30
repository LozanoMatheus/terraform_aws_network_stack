resource "aws_vpc" "main" {
  cidr_block       = "${var.base_cidr_block}"
  instance_tenancy = "default"

  tags {
    Name = "vpc-training-mlozano-tf"
  }
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}
