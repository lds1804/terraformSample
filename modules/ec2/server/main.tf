locals {
  instance-userdata = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo docker run -d -p 8080:8080 mrbarker/python-flask-hello
EOF
}




resource "aws_instance" "server" {


  ami = "ami-0e32ec5bc225539f5"
  instance_type = "t2.nano"
  subnet_id= "${var.subnet_id}"
  tags {
    Name = "${terraform.workspace}-server"
  }
  key_name="testOregonCluster"
  security_groups = ["${var.security_groups}" ]

  associate_public_ip_address= "true"

  user_data_base64 = "${base64encode(local.instance-userdata)}"

  
}
