resource "aws_subnet" "public-subnet-1a" {
  vpc_id = var.vpc_id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"
  tags={
    Name="pub-sub-1a"
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id = var.vpc_id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.2.0/24"
  tags={
    Name="pub-sub-1b"
  }
}

resource "aws_subnet" "private-subnet-1a" {
  vpc_id = var.vpc_id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.3.0/24"
  tags={
    Name="pvt-sub-1a"
  }
}

resource "aws_subnet" "private-subnet-1b" {
  vpc_id = var.vpc_id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.4.0/24"
  tags={
    Name="pvt-sub-1b"
  }
}



resource "aws_route_table" "rt-private" {
    vpc_id = var.vpc_id
    tags = {
        Name="private-rt"
    }
}


resource "aws_route_table_association" "public-asso" {
  count          = 2
  subnet_id      = [aws_subnet.public-subnet-1a.id, aws_subnet.public-subnet-1b.id][count.index]
  route_table_id = var.defualt_rt_id
}


resource "aws_route_table_association" "private-asso" {
  count          = 2
  subnet_id      = [aws_subnet.private-subnet-1a.id, aws_subnet.private-subnet-1b.id][count.index]
  route_table_id = aws_route_table.rt-private.id
}