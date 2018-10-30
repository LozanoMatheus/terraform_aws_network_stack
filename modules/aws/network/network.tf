module "vpc" {
  source             = "./vpc"
  
  base_cidr_block    = "${var.base_cidr_block}"
}

module "subnet" {
  source             = "./subnet"

  vpc_id             = "${module.vpc.vpc_id}"
  az                 = "${var.az}"
  public_cidr        = "${var.public_cidr}"
  private_cidr       = "${var.private_cidr}"
}

module "internet_gateway" {
  source             = "./internet_gateway"

  vpc_id             = "${module.vpc.vpc_id}"
}

module "nat_gateway" {
  source              = "./nat_gateway"

  az                  = "${var.az}"
  public_subnet_ids   = "${module.subnet.public_subnet_ids}"
}

module "route_table" {
  source             = "./route_table"

  base_cidr_block    = "${var.base_cidr_block}"
  vpc_id             = "${module.vpc.vpc_id}"
  igw_id             = "${module.internet_gateway.igw_id}"
  nat_gw_id          = "${module.nat_gateway.nat_gw_id}"
}
