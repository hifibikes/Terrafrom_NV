#!/bin/bash
yum install httpd -y
mkdir /var/www/html/laptop/ 
echo "<h1> This is Laptop Page" > /var/www/html/laptop/index.html
systemctl start httpd
systemctl enable httpd 
