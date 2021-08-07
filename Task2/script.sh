#!/bin/sh
sudo yum update
sudo amazon-linux-extras install epel
sudo amazon-linux-extras install nginx1
sudo nginx
OS=$(uname -a)
sudo echo "<!DOCTYPE html> <html> <head> <title>Exadel!</title> <style> body { width: 35em; margin: 0 auto; font-family: Tahoma, Verdana, Arial, sans-serif; } </style> </head> <body> <h1> Hello World</h1> <p>Os Version</p> $OS </body> </html>" > /usr/share/nginx/html/index.html


