resource "aws_instance" "web_serever" {
  ami =    var.ami[0] 
  #count = 2
  instance_type = var.instance_type
  tags = {
    "Name" = "Web-Server"
    "Env" = "Dev"
  }
   key_name = var.key_name
   availability_zone = var.az["az1"]
   vpc_security_group_ids = [ aws_security_group.tf-sg.id]
   user_data = file("httpd.sh")
}