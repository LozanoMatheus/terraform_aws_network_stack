resource "aws_internet_gateway" "gw" {
  vpc_id            = "${var.vpc_id}"

  tags {
    Name = "igw-training-mlozano-tf"
  }
}

output "igw_id" {
  value = "${aws_internet_gateway.gw.id}"
}
