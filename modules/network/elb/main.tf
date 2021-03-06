resource "aws_elb" "test" {
  name               = "test-terraform-elb"
  #availability_zones = ["us-west-2a", "us-west-2b"]
  subnets= ["${var.subnet_id}"]

  security_groups= ["${var.security_groups}"]
  

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

 
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

  instances                   = ["${var.instance_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "teste-terraform-elb"
  }
}