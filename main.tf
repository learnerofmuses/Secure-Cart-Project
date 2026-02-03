#ROOT MODULE: main.tf
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id = module.vpc.vpc_id
}

module "rds" {
  source = "./modules/rds"

  vpc_id = module.vpc.vpc_id
  private_subnet_a_id = module.vpc.private_subnet_a_id
  private_subnet_b_id = module.vpc.private_subnet_b_id
  app_sg_ids = [module.ec2.secure_cart_app_security_group_id]

  db_username = var.db_username
  db_password = var.db_password
  multi_az = var.multi_az
}

module "alb" {
  source = "./modules/alb"
}

module "ec2" {
  source = "./modules/ec2"

  db_host = module.rds.db_instance_endpoint
  db_port = module.rds.db_port

  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_a_id
  #private_subnet_id_b = module.vpc.private_subnet_b_id

  bastion_instance_type_id = var.bastion_instance_type_id
  bastion_ami_id = var.bastion_ami_id
  bastion_sg_id = module.security_groups.bastion_sg_id

  secure_cart_instance_type_id = var.secure_cart_instance_type_id
  secure_cart_ami_id = var.secure_cart_ami_id
  secure_cart_app_sg_id = module.security_groups.secure_cart_app_sg_id
  
  
  key_name = var.key_name
}