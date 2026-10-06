output "vpc_id" {
  value =  aws_vpc.main_vpc.id
}

output "defualt_rt_id"{
    value = aws_default_route_table.defualt_rt_public.id
}