what need to do?


MAIN : 

Deploy three virtual machines in the Cloud. Install Ansible on one of them (control_plane).
Ping pong - execute the built-in ansible ping command. Ping the other two machines.
My First Playbook: write a playbook for installing Docker on two machines and run it.


EXTRA : 

EXTRA 1. Write a playbook for installing Docker and one of the (LAMP/LEMP stack, Wordpress, ELK, MEAN - GALAXY do not use) in Docker.
EXTRA 2. Playbooks should not have default creds to databases and/or admin panel.
EXTRA 3. For the execution of playbooks, dynamic inventory must be used (GALAXY can be used).





How was it done?


I Created 3 Virtual machines on AWS...

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/t5-2.png)


Connected via SSH to Main one and installed ansible via command for amazon linux 2: sudo amazon-linux-extras install ansible2


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/t5-1.png)



For Ping pong I created hosts.txt file where We have host linux IP, user and SSH-KEY...

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/t5-5.png)


now we can connect to our hosts via ping command : ansible -i hosts.txt all -m ping 


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/t5-4.png)








