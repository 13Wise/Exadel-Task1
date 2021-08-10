provider "aws" {
  region = "eu-west-1"
}


resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Main VPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.12.0/24"

  tags = {
    Name = "Private Subnet"
  }
}



resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "Main IGW"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [
    aws_internet_gateway.igw
  ]

  tags = {
    Name = "NAT Gateway EIP"
  }

}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "Main NAT Gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}


resource "aws_instance" "AmazonLinux" {
  ami                    = "ami-02b4e72b17337d6c1" #amazon linux
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.amazonlinuxsg.id]
  subnet_id              = aws_subnet.public.id
  user_data              = file("script.sh")

  tags = {
    name = "Amazon Linux"
  }
}

resource "aws_instance" "Ubuntu" {
  ami                    = "ami-0a8e758f5e873d1c1" #Ubuntu
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ubuntusg.id]
  subnet_id              = aws_subnet.private.id

  tags = {
    name = "Ubuntu"
  }
}


resource "aws_security_group" "amazonlinuxsg" {
  name        = "Amazon Linux SG"
  description = "SG for nginx"
  vpc_id      = aws_vpc.main-vpc.id

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG AMAZON LINUX"
  }
}




resource "aws_security_group" "ubuntusg" {
  name        = "Ubuntu SG"
  description = "SG for ubuntu"
  vpc_id      = aws_vpc.main-vpc.id


  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }


  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  dynamic "egress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }

  tags = {
    Name = "SG UBUNTU"
  }
}


