resource "aws_instance" "web_serever" {
  ami =    var.ami[0] 
  count = 2
  instance_type = var.instance_type
  tags = {
    "Name" = "Web-Server"
    "Env" = "Dev"
  }
   key_name = var.key_name
   availability_zone = var.az["az1"]
    
}