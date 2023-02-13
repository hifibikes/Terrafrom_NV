#/bin/bash
yum install httpd -y
echo <h1> "This is Terrafrom Web Instance" </h1> >> /var/www/html/index.html
systemctl start httpd 
systemctl enable httpd 