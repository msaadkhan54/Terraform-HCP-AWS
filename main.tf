provider "aws" {
  region = "us-east-1"
}

module "VPC" {
  source="./VPC"
}

module "Subnets" {
    source = "./Subnets"
    vpc_id=module.VPC.vpc_id
    defualt_rt_id = module.VPC.defualt_rt_id
}

module "EC2" {
    source = "./EC2"
    vpc_id = module.VPC.vpc_id
    public_subnets_id = module.Subnets.public_subnets_id
    private_subnets_id = module.Subnets.private_subnets_id
}

