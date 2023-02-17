resource "aws_instance" "ec2" {
  tags = {
    "Name" = "tf01"
  }
  instance_type = "t2.micro"
  ami = "ami-0aa7d40eeae50c9a9"

  provisioner "local-exec" {
   command = "echo ${self.private_ip} >> private_ip.txt"
 }
}