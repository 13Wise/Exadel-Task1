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

![alt text](

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-4.JPG)


After It I install plugins: Docker, Docker-API, Docker Pipeline 



For connection to docker first i change docker.service config file "/lib/systemd/system/docker.service"  and add "ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock"

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-8.JPG)



After it on jenkins GUI I add Cloud "docker"

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T6-7.JPG)

