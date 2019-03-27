provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}


module "vpc_network" {
  source = "./modules/network/vpc/"
}



module "igw_network" {
  source = "./modules/network/igw/"
  vpc_id = "${module.vpc_network.vpc_id}"
}


module "route_table_network" {
  source = "./modules/network/route_table/"
  vpc_id = "${module.vpc_network.vpc_id}"
  igw_id = "${module.igw_network.igw_id}"
  
}



module "subnet_network" {
  source = "./modules/network/subnet/"
  vpc_id = "${module.vpc_network.vpc_id}"
  vpc_cidr_prefix = "${module.vpc_network.vpc_cidr_prefix}"
  region = "${var.region}"
  public_rt_id = "${module.route_table_network.public_rt_id}"
  
}



module "server_sg" {
  source = "./modules/network/security_group/sg_server"
  vpc_id = "${module.vpc_network.vpc_id}"
  
}




module ec2_master {

  source ="./modules/ec2/server"
  subnet_id="${module.subnet_network.public_subnet_id}"
  
  security_groups= "${module.server_sg.server_sg_id}"
    
}



module elb {
  
  source ="./modules/network/elb"
  instance_id="${module.ec2_master.instance_id}"
  security_groups= "${module.server_sg.server_sg_id}"
  subnet_id=["${module.subnet_network.public_subnet_id}","${module.subnet_network.public_subnet_id2}"]

}


