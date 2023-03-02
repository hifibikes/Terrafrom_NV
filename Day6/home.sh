#!/bin/bash
yum install httpd -y
echo "<h1> This is Home Page" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd 
