what need to do?

1) Create EC2 Instance t2.micro
     Amazon Linux
     Ubuntu
     Both instances must have a tag with names. 
2) EC2 Amazon Linux must have Internet access, there must be incoming access: ICMP, TCP/22, 80, 443, and any outgoing access. 
3) EC2 Ubuntu should not have access to the Internet, but must have outgoing and incoming access: ICMP, TCP/22, 80, 443 only on the local network where EC2 Ubuntu, EC2 CentOS is located. 
4) On EC2 Ubuntu, install a web server (nginx/apache);
     - Create a web page with the text “Hello World” and information about the current version of the operating system. This page must be visible from the Internet. 
5) On EC2 Ubuntu install Docker, installation should be done according to the recommendation of the official Docker manuals 




how was it done? 


1) Installed Terraform...
created code for instances with Tags... 

resource "aws_instance" "AmazonLinux" {
  ami                    = "ami-02b4e72b17337d6c1" #amazon linux
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.amazonlinuxextrasg.id]
  subnet_id              = aws_subnet.public-extra.id
  user_data              = file("script.sh")

  tags = {
    name = "Amazon Linux"
  }
}

resource "aws_instance" "Ubuntu" {
  ami                    = "ami-0a8e758f5e873d1c1" #Ubuntu
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ubuntuextrasg.id]
  subnet_id              = aws_subnet.private-extra.id

  tags = {
    name = "Ubuntu"
  }
}



2) Created Security Group For Amazon Linux instance.
