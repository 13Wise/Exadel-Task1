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
Created aws_instances... or full code please see main.tf


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/M1.png)



2) Created Security Group For Ubuntu instance To have incoming and outgoing access on ports from anywhere...

incoming 


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/M2.png)


outgoing


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/M3.png)


3) Created Security Group For Centos Instance To have incoming and outgoing access on ports from only local network

incoming

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/M4.png)


outgoing


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/m5.png)


4-5) Created script.sh which Can install nginx on ubuntu + will change default nginx file and will install docker on ubuntu...

for code Please See script.sh File



Thank you...



