#!/bin/bash
echo "<html><body><h1 align=center>vano akhvlediani sandbox 2021<br>$DEVOPS</h1></body></html>"  > /var/www/html/index.html 
/usr/sbin/apache2ctl -DFOREGROUND
