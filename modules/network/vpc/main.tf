resource "aws_vpc" "banco-scopus" {
  cidr_block = "${lookup(var.vpc_cidr_prefix, terraform.workspace)}.${lookup(var.vpc_cidr_suffix, terraform.workspace)}"
  enable_dns_hostnames = true
  tags {
    Name = "${terraform.workspace}-server-vpc"
    Environment = "${terraform.workspace}"
  }
}
