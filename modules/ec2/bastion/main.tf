resource "aws_instance" "bastion-banco-scopus" {
  ami = "ami-0f9cf087c1f27d9b1"  
  associate_public_ip_address="true"
  instance_type = "t2.small"
  subnet_id= "${var.subnet_id}"
  tags {
    Name = "${terraform.workspace}-bastion-banco-scopus"
  }
  key_name="kubernetes"
  security_groups = ["${var.security_groups}" ]
}
