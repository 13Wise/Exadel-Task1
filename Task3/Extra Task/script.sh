#!/bin/sh
sudo yum update
sudo amazon-linux-extras install epel
sudo amazon-linux-extras install nginx1
sudo nginx
OS=$(uname -a)
cat <<EOF > /usr/share/nginx/html/index.html
<html>
<h2 align=center> Hello World!</h2><br>
<p align=center>$OS</p>
</html>
EOF
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user


