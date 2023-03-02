#!/bin/bash
yum install httpd -y
mkdir /var/www/html/mobile/ 
echo "<h1> This is Mobile Page" > /var/www/html/mobile/index.html
systemctl start httpd
systemctl enable httpd 
