variable "region" {

}

variable "base_cidr_block" {
  type = "map"
  default = {
    "us-east-1" = "10.10.0.0/16"
    "us-west-2" = "10.11.0.0/16"
  }
}

variable "az" {
  description = "Run the EC2 Instances in these Availability Zones"
  type = "list"
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_cidr" {
  type = "list"
  default = ["172.86.1.0/24", "172.86.2.0/24"]
}

variable "private_cidr" {
  type = "list"
  default = ["172.86.254.0/24", "172.86.255.0/24"]
}
