## Public Subnet 
resource "aws_subnet" "public-subnet" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.vpc_cidr_prefix}.0.0/19"
  availability_zone = "${var.region}a"
  tags {
    Name = "${terraform.workspace}-server-public-subnet"
    Environment = "${terraform.workspace}"
    Type = "public"
  }
}

## Public Subnet 2
resource "aws_subnet" "public-subnet2" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "10.2.32.0/19"
  availability_zone = "${var.region}b"
  tags {
    Name = "${terraform.workspace}-server-public2-subnet"
    Environment = "${terraform.workspace}"
    Type = "public"
  }
}



## Route table associations
resource "aws_route_table_association" "public-subnet" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${var.public_rt_id}"
}


## Route table associations
resource "aws_route_table_association" "public-subnet2" {
  subnet_id = "${aws_subnet.public-subnet2.id}"
  route_table_id = "${var.public_rt_id}"
}

