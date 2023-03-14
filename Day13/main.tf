resource "aws_instance" "ec2" {
  ami = "ami-0aa7d40eeae50c9a9"
  instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = "map"
  default = {
    default = "t2.nano"
    dev = "t2.micro"
    prod = "t2.medium"
  }
}