what need to do?

MAIN :
1. Zabbix:
Big brother is watching  ....
1.1 Install on server, configure web and base
1.2 Prepare VM or instances. Install Zabbix agents on previously prepared servers or VM.
EXTRA 1.2.1: Complete this task using ansible
1.3 Make several of your own dashboards, where to output data from your triggers (you can manually trigger it)
1.4 Active check vs passive check - use both types.
1.5 Make an agentless check of any resource (ICMP ping)
1.6 Provoke an alert - and create a Maintenance instruction
1.7 Set up a dashboard with infrastructure nodes and monitoring of hosts and software installed on them

2. ELK:
Nobody is forgotten and nothing is forgotten.
2.1 Install and configure ELK
2.2 Organize collection of logs from docker to ELK and receive data from running containers
2.3 Customize your dashboards in ELK
EXTRA 2.4: Set up filters on the Logstash side (get separate docker_container and docker_image fields from the message field)
2.5 Configure monitoring in ELK, get metrics from your running containers
2.6 Study features and settings

3. Grafana:
3.1 Install Grafana
3.2 Integrate with installed ELK
3.3 Set up Dashboards
3.4 Study features and settings




How was it done?


1. Big Brother....

I install Ubuntu in VM, Simply commands for install zabbix... "sudo apt update && sudo apt upgrade"(for update system), "wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb", "dpkg -i zabbix-release_5.0-1+focal_all.deb"(for install zabbix), "`sudo apt update && sudo apt upgrade"(one more update), "sudo apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent mysql-server"(install zabbix server, frontend agent, Database)...
after it mySql configure "sudo mysql_secure_installation" to create user password...


now we can log in to my sql "sudo mysql -u root -p" and create database "create database zabbix character set utf8 collate utf8_bin;" (we should create user also with password, I called it "zabbix") here is command "create user zabbix@localhost identified by 'OurPassword';"... now we should grant privilegis to our user "grant all privileges on zabbix.* to zabbix@localhost;" and flush it "flush privileges;"... nice we can go for next step...


now we should import initial schema and data to that database... for this we can use command "sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -u zabbix -p zabbix" now we should use password which we created before and wait for a few seconds... so now we can log in to our mysql("sudo mysql -u root -p") and check ... 

first command : "use zabbix;"
second command : "show tables;"

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T7-3.JPG)

so everythin is okay, we can go to next step...


so now we should update our zabbix server DB password "sudo nano /etc/zabbix/zabbix_server.conf"

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T7-4.JPG)


nice... go to next step and cofingre our php for zabbix frontend... go to "/etc/zabbix/apache.conf" and change PHP version 7, php_value date.timezone to Etc/GMT-4 (for me, you can see it on https://www.php.net/manual/en/timezones.php https://www.php.net/manual/en/timezones.php)...

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T7-5.JPG)


now we should restart our services "sudo systemctl restart zabbix-server zabbix-agent apache2", then check status "sudo service zabbix-server status" and type this command for auto start "sudo systemctl enable zabbix-server zabbix-agent apache2"...

nice.... now we can go to browse and type "http://127.0.0.1/zabbix/"

![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T7-6.JPG)

here we go, now we can setup our zabbix...

So if we did everything correctly we should see page with Username and password... User is : "Admin"(First cappital letter) and password is "zabbix"... now we are logged in...


![alt text](https://s3.eu-west-1.amazonaws.com/by.bucket-exadel/T7-7.JPG)