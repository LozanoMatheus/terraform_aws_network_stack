resource "aws_eip" "nat" {
  vpc   = true

  count = "${length(var.az)}"

  lifecycle { create_before_destroy = true }

  tags {
    Name = "private-rtb-training-mlozano-tf-${count.index}"
  }
}

output "nat_gw_id" {
  value = "${join(",", aws_nat_gateway.nat.*.id)}"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(split(",", var.public_subnet_ids), count.index)}"

  count = "${length(var.az)}"

  lifecycle { create_before_destroy = true }

  tags {
    Name = "private-rtb-training-mlozano-tf-${count.index}"
  }
}
