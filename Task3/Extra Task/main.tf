provider "aws" {
  region = "eu-west-1"
}


resource "aws_vpc" "main-vpc-extra" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "Main VPC"
  }
}

resource "aws_subnet" "public-extra" {
  vpc_id                  = aws_vpc.main-vpc-extra.id
  cidr_block              = var.public_subnet_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet Extra"
  }
}

resource "aws_subnet" "private-extra" {
  vpc_id     = aws_vpc.main-vpc-extra.id
  cidr_block = var.private_subnet_cidr_block

  tags = {
    Name = "Private Subnet Extra"
  }
}



resource "aws_internet_gateway" "igw-extra" {
  vpc_id = aws_vpc.main-vpc-extra.id

  tags = {
    Name = "Extra IGW"
  }
}

resource "aws_eip" "nat_eip-extra" {
  vpc = true
  depends_on = [
    aws_internet_gateway.igw-extra
  ]

  tags = {
    Name = "NAT Gateway EIP Extra"
  }

}


resource "aws_nat_gateway" "nat-extra" {
  allocation_id = aws_eip.nat_eip-extra.id
  subnet_id     = aws_subnet.public-extra.id

  tags = {
    Name = "Main NAT Gateway Extra"
  }
}

resource "aws_route_table" "public-extra" {
  vpc_id = aws_vpc.main-vpc-extra.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-extra.id
  }

  tags = {
    Name = "Public Route Table Extra"
  }
}

resource "aws_route_table_association" "public-extra" {
  subnet_id      = aws_subnet.public-extra.id
  route_table_id = aws_route_table.public-extra.id
}


resource "aws_route_table" "private-extra" {
  vpc_id = aws_vpc.main-vpc-extra.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-extra.id
  }

  tags = {
    Name = "Private Route Table Extra"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-extra.id
  route_table_id = aws_route_table.private-extra.id
}




resource "aws_key_pair" "key" {
  key_name   = var.public_key_name
  public_key = var.public_key
}

resource "aws_network_interface" "my_network" {
  subnet_id       = aws_subnet.public-extra.id
  private_ips     = ["11.0.11.100"]
  security_groups = [aws_security_group.amazonlinuxextrasg.id]

  tags = {
    Name = "amazonlinux_network_interface"
  }
}


resource "aws_network_interface" "my_network2" {
  subnet_id       = aws_subnet.private-extra.id
  private_ips     = ["11.0.12.110"]
  security_groups = [aws_security_group.ubuntuextrasg.id]

  tags = {
    Name = "ubuntu_network_interface"
  }
}

data "aws_ami" "ami_amazonlinux" {
  owners      = [var.owner_id]
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_amazonlinux]
  }
}

data "aws_ami" "ami_ubuntu" {
  owners      = [var.owner_id]
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_ubuntu]
  }

}



resource "aws_instance" "AmazonLinuxExtra" {
  ami           = data.aws_ami.ami_amazonlinux.id #amazon linux
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key.id
  user_data     = file("script.sh")

  network_interface {
    network_interface_id = aws_network_interface.my_network.id
    device_index         = 0
  }

  tags = {
    Name = "Amazon Linux Extra"
  }
}

resource "aws_instance" "UbuntuExtra" {
  ami           = data.aws_ami.ami_ubuntu.id #Ubuntu
  instance_type = var.instance_type_ubuntu
  key_name      = aws_key_pair.key.id
  user_data     = file("ubuntu.sh")


  network_interface {
    network_interface_id = aws_network_interface.my_network2.id
    device_index         = 0
  }


  tags = {
    Name = "Ubuntu Extra"
  }
}


resource "aws_security_group" "amazonlinuxextrasg" {
  name        = "Amazon Linux Extra SG"
  description = "SG for nginx"
  vpc_id      = aws_vpc.main-vpc-extra.id

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
    Name = "Extra SG AMAZON LINUX"
  }
}




resource "aws_security_group" "ubuntuextrasg" {
  name        = "Ubuntu SG"
  description = "SG for ubuntu"
  vpc_id      = aws_vpc.main-vpc-extra.id


  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["11.0.11.100/32"]
    }
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["11.0.11.100/32"]
  }

  dynamic "egress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["11.0.11.100/32"]
    }
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["11.0.11.100/32"]
  }

  tags = {
    Name = "Extra SG UBUNTU"
  }
}


