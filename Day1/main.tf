resource "aws_instance" "web_serever" {
  ami = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Web-Server"
    "Env" = "Dev"
  }
   key_name = "NV_Mayank"
    
}