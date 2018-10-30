resource "aws_subnet" "main_public" {
  count             = "${length(var.az)}"
  vpc_id            = "${var.vpc_id}"
  availability_zone = "${element(var.az, count.index)}"
  cidr_block        = "${element(var.public_cidr, count.index)}"

  tags {
    Name = "public-training-mlozano-tf-${count.index}"
  }
}

resource "aws_subnet" "main_private" {
  count             = "${length(var.az)}"
  vpc_id            = "${var.vpc_id}"
  availability_zone = "${element(var.az, count.index)}"
  cidr_block        = "${element(var.private_cidr, count.index)}"

  tags {
    Name = "private-training-mlozano-tf-${count.index}"
  }
}

output "public_subnet_ids" {
  value = "${join(",", aws_subnet.main_public.*.id)}"
}
