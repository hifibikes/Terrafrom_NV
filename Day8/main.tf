module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  name = "module-ec2-instance"
  ami = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  key_name = "NV_Mayank"
  tags = {
      Env = "dev"
  }
}