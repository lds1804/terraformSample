## IGW
resource "aws_nat_gateway" "nat" {
  subnet_id =  "${var.subnet_id}"
  allocation_id= "${var.allocation_id}"
  tags {
    Name = "${terraform.workspace}-banco-scopus-nat"
    Environment = "${terraform.workspace}"
  }
}
