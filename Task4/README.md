what need to do?



1. Install docker. (Hint: please use VMs or Clouds  for this.) 
   EXTRA 1.1. Write bash script for installing Docker. 
 
2. Find, download and run any docker container "hello world". (Learn commands and parameters to create/run docker containers.
   EXTRA 2.1. Use image with html page, edit html page and paste text: <Username> Sandbox 2021
 
3.1. Create your Dockerfile for building a docker image. Your docker image should run any web application (nginx, apache, httpd). Web application should be located inside the docker image. 
     EXTRA 3.1.1. For creating docker image use clear basic images (ubuntu, centos, alpine, etc.)
3.2. Add an environment variable "DEVOPS=<username> to your docker image 
     EXTRA 3.2.1. Print environment variable with the value on a web page (if environment variable changed after container restart - the web page must be updated with a new value)
 
4. Push your docker image to docker hub (https://hub.docker.com/). Create any description for your Docker image. 
   EXTRA 4.1. Integrate your docker image and your github repository. Create an automatic deployment for each push. (The Deployment can be in the “Pending” status for 10-20 minutes. This is normal).
 
 
5.  Create docker-compose file. Deploy a few docker containers via one docker-compose file. 
      first image - your docker image from the previous step. 5 nodes of the first image should be run;
      second image - any java application;
      last image - any database image (mysql, postgresql, mongo or etc.).
      Second container should be run right after a successful run of a database container.
	  EXTRA 5.1. Use env files to configure each service.
    
    
    
    
    How was it done?
    
    
    1) Created Script for AWS Instance User Data...(EXTRA 1.1)
    
    
    ![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/t4-1.png)

    
	
    2) log in into docker via SSH and run command "docker run hello-world"
	
	
	![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/t4-2.png)
	
	
	so now we have docker image "hello-world"
	
	![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/t4-3.png)
	
	
	