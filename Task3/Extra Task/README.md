what need to do?
6) Complete  step 1, but AMI ID cannot be hardcoded. You can hardcode operation system name, version, etc. 
7) Step 3 read as: 
EC2 CentOS should have outgoing and incoming access: ICMP, TCP/22, 80, 443, only to EC2 Ubuntu. 
8) On EC2 CentOS install nginx (note. Remember about step 7, the task can be done in any way, it is not necessary to use terraform)
   - Create a web page with the text “Hello World” and information about the current version of the operating system. This page must be visible from the  EC2 Ubuntu.


How was it done?


6) Created Instances Images on AWS... Then Take Image Name into terraform code

variables.tf 

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/1.png)

main.tf

create data




![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/2.png)


create AWS instance via Ami data


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/3.png)


7) Createt network interface for amazon linux to have Static IP


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/4.png)


Created security groups for Centos...
Incoming access only from Ubuntu


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/5.png)


Outgoing access only from Ubuntu 


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/6.png)



8) We Should Download Nginx From our public Ubuntu Linux... For that first off all we should open SSH TUNEL

command : 
 ssh -i exadel.pem -NTf -D 11.0.12.110:2080 ec2-user@11.0.11.100


After that we Should change our configuration file sudo vi /etc/yum.conf and add here our host and port

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/7.png)


now we can install nginx

sudo yum install nginx...

we can check nginx version

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/8.png)


we should change our index.html file via script.sh

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/9.png)

if we did everything right we should see our HTML file from host via curl


![alt_text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/10.png)



FOR FULL Terraform Code Please SEE main.tf and variables.tf


Thank you

