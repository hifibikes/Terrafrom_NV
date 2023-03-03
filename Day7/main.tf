terraform {
  backend "s3" {
    bucket = "bucket-in28min-123123"
    key    = "terrafrom_state_file/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

resource "aws_instance" "public_ec2" {
  ami =  var.ami[0]
  instance_type = var.instance_type
  count = var.env == "prod" ? 2 : 1
  key_name = var.key_name
  tags = {
    "name" = "Public-ec2"
  }
  #subnet_id = aws_subnet.public_subnet.id
}
