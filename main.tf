module "vpc" {
    source              = "./vpc"
    cidr_block          = var.cidr_block
    vpc_name            = var.vpc_name
    private_subnets     = var.private_subnets
    public_subnets      = var.public_subnets
}


module "postgres"{
    source               = "./postgres"
    db_name              = var.db_name
    db_port              = var.db_port
    db_subnet_group_name = module.vpc.db_subnet_group_name
    vpc_id               = module.vpc.vpc_id
    vpc_name             = var.vpc_name
    private_subnets      = var.private_subnets
    depends_on           = [module.vpc]

}

module "ec2" {
    source               = "./ec2"
    public_subnet_list   = module.vpc.public_subnet_list
    vpc_id               = module.vpc.vpc_id
    depends_on           = [module.vpc]
}

