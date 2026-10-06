resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags ={
    Name="Saad-vpc"
  }
}

resource "aws_default_route_table" "defualt_rt_public" {
    default_route_table_id = aws_vpc.main_vpc.default_route_table_id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
    tags = {
        Name="public-rt"
    }
}


resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
        Name="Saad-igw"
    }
}
