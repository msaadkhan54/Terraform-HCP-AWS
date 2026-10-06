output "public_subnets_id" {
    value=[aws_subnet.public-subnet-1a.id,aws_subnet.public-subnet-1b.id]
}

output "private_subnets_id" {
    value=[aws_subnet.private-subnet-1a.id,aws_subnet.private-subnet-1b.id]
}