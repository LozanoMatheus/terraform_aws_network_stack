module "network" {
    source = "../../../modules/aws/network"

    az = "${var.az}"
    base_cidr_block = "${lookup(var.base_cidr_block, var.region)}"
    public_cidr = "${var.public_cidr}"
    private_cidr = "${var.private_cidr}"

}
