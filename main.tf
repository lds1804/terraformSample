provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}


module "vpc_network" {
  source = "./modules/network/vpc/"
}


#module "eip_nat_network" {
# source = "./modules/network/eip/"
#
#}

module "igw_network" {
  source = "./modules/network/igw/"
  vpc_id = "${module.vpc_network.vpc_id}"
}


module "route_table_network" {
  source = "./modules/network/route_table/"
  vpc_id = "${module.vpc_network.vpc_id}"
  igw_id = "${module.igw_network.igw_id}"
  #nat_id = "${module.nat_network.nat_id}"
}



module "subnet_network" {
  source = "./modules/network/subnet/"
  vpc_id = "${module.vpc_network.vpc_id}"
  vpc_cidr_prefix = "${module.vpc_network.vpc_cidr_prefix}"
  region = "${var.region}"
  public_rt_id = "${module.route_table_network.public_rt_id}"
  #private_rt_id = "${module.route_table_network.private_rt_id}"
}


#module "nat_network" {
#  source = "./modules/network/nat/"
#  subnet_id="${module.subnet_network.public_subnet_id}"
#  allocation_id= "${module.eip_nat_network.eip_id}"
#}


#module "bastion_sg" {
#  source = "./modules/network/security_group/sg_bastion"
#  vpc_id = "${module.vpc_network.vpc_id}"
#}

module "server_sg" {
  source = "./modules/network/security_group/sg_server"
  vpc_id = "${module.vpc_network.vpc_id}"
  
}



#module lc_server {

#  source ="./modules/asg/launch_configuration/lc_server"
#  security_groups= "${module.server_sg.server_sg_id}"

#}


#module server_asg {

#  source ="./modules/asg/server"
#  public_subnet="${module.subnet_network.public_subnet_id}"
#  lc_server_id= "${module.lc_server.lc_server_id}"
  

  
#}






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


