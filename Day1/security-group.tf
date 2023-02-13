resource "aws_security_group" "tf-sg" {
   name = "allow-ssh-http"
   tags = {
      Name = "ec2-sg"
   } 
    ingress  {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "value"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }

    ingress  {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "value"
      from_port = 80
      protocol = "tcp"
      to_port = 80
    } 
    egress {
         cidr_blocks = [ "0.0.0.0/0" ]
         description = "value"
         from_port = 0
         protocol = "-1"
         to_port = 0
    }

}