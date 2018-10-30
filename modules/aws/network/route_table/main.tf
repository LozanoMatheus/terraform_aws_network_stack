resource "aws_route_table" "main_public" {
  vpc_id = "${var.vpc_id}"
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${var.igw_id}"
  }

  tags {
    Name = "public-rtb-training-mlozano-tf"
  }
}

resource "aws_route_table" "main_private" {
  vpc_id = "${var.vpc_id}"
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = "${element(split(",", var.nat_gw_id), count.index)}"
  }

  tags {
    Name = "private-rtb-training-mlozano-tf"
  }
}
