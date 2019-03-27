resource "aws_instance" "node1-banco-scopus" {
  ami = "ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  subnet_id= "${var.subnet_id}"
  tags {
    Name = "${terraform.workspace}-nodes-banco-scopus"
  }
  security_groups = ["${var.security_groups}"]
  key_name="kubernetes"
}



resource "aws_instance" "node2-banco-scopus" {
  ami = "ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  subnet_id= "${var.subnet_id}"
  tags {
    Name = "${terraform.workspace}-nodes-banco-scopus"
  }
  security_groups = ["${var.security_groups}"]
  key_name="kubernetes"
}

