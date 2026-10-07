resource "aws_security_group" "pub-sg" {
    vpc_id = var.vpc_id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    # ingress {
    #     from_port = 80
    #     to_port = 80
    #     protocol = "tcp"
    #     cidr_blocks = [ "0.0.0.0/0" ]
    # }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "key_pair" {
    key_name = "saad-key"
    public_key = file("C:/Users/Hp/Downloads/saad-pub.txt")
}

resource "aws_instance" "ec2-pub" {
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.pub-sg.id ]
    ami = "ami-0d27e0fb3bac4d724"
    subnet_id = var.public_subnets_id[0]
    key_name = aws_key_pair.key_pair.key_name
    associate_public_ip_address = true
    tags = {
        Name="saad-linux-pub"
    }
}
