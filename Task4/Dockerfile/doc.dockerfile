FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install apache2
RUN echo "<html><body><h1 align=center>vano akhvlediani sandbox 2021</h1></body></html>"  > /var/www/html/index.html



CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]


EXPOSE 80







