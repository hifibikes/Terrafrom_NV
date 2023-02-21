resource "aws_instance" "ec2" {
  tags = {
    "Name" = "tf01"
  }
  instance_type = "t2.micro"
  ami = "ami-0aa7d40eeae50c9a9"
  key_name = "NV_Mayank"
#   provisioner "local-exec" {
#    command = "echo ${self.private_ip} >> private_ip.txt"
#  }

  # provisioner "file" {
  #   source      = "http"
  #   destination = "/home/ec2-user/http"
     
  #   connection {
  #        user = "ec2-user"
  #        type = "ssh"
  #        private_key = file("NV_Mayank.pem")
  #        host = self.public_ip
  #   }

  # } 
  
   provisioner "remote-exec" {
       connection {
         user = "ec2-user"
         type = "ssh"
         private_key = file("NV_Mayank.pem")
         host = self.public_ip
    }
     inline = [
       "sudo yum install httpd -y",
       "sudo systemctl start httpd"
     ]

   }


}