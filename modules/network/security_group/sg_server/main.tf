## Security group for Kubernete Cluster
resource "aws_security_group" "server-sg" {
  vpc_id = "${var.vpc_id}"
  name = "${terraform.workspace}-server-sg"
  
  tags {
    Name = "${terraform.workspace}-server-sg"
    Environment = "${terraform.workspace}"
    Type = "private"
  }

 

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }




 
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }


}
