output "instance_name" {
  value = aws_instance.web_serever.tags
}
output "instance_id" {
  value = aws_instance.web_serever.id
}
output "ami" {
  value = aws_instance.web_serever.ami
}

output "Instance_ip" {
  value = aws_instance.web_serever.private_ip
} 