resource "aws_security_group" "sg" {
   name = "my-sg"
   dynamic "ingress" {
     for_each = var.port
     content {
        from_port = ingress.key
        to_port = ingress.key
        protocol = "tcp"
        cidr_blocks = ingress.value
     } 
   }
}