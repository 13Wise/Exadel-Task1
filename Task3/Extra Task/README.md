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
