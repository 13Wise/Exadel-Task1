what need to do?

MAIN :


1. Install Jenkins. It must be installed in a docker container.
2. Install necessary plugins (if you need).
3. Configure several (2-3) build agents. Agents must be run in docker.
4. Create a Freestyle project. Which will show the current date as a result of execution.
5. Create Pipeline which will execute docker ps -a in docker agent, running on Jenkins master’s Host.
6. Create Pipeline, which will build artefact using Dockerfile directly from your github repo (use Dockerfile from previous task).
7. Pass  variable PASSWORD=QWERTY! To the docker container. Variable must be encrypted!!!




How was it done?

1) Created AWS Instance ubuntu... installed docker on it... install docker image jenkins and run it...

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-1.JPG)

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-2.JPG)

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-3.JPG)



2) I Installed Sugested Plugins From jenkins and configure new admin user and password...

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-6.JPG)

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-4.JPG)


After It I install plugins: Docker, Docker-API, Docker Pipeline 


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-5.JPG)



For connection to docker first i change docker.service config file "/lib/systemd/system/docker.service"  and add "ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock"

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-8.JPG)



After it on jenkins GUI I add Cloud "docker"

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-7.JPG)


after I added Docker agent Template... Configure it and Save it... so I created new job "test" for check if my agent work perfectly and here we go...


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-9.JPG)


for another agent I did same way...


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-10.JPG)



![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-11.JPG)



![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-12.JPG)

 
Now we should create freestyle job which will show us current time... so first we should add plugin called "Build timestamp" and configure it to GMT+4


so after we can create New freestyle job and build it...

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-13.JPG)


Here we go... 

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-14.JPG)


So now we should create Pipeline...

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-20.JPG)

and build it... here we have Result

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-15.JPG)


no we should create another pipeline and use dockerfile from our github...

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-18.JPG)

here is the result 

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-16-1.JPG)

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-16-2.JPG)

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-16-3.JPG)

