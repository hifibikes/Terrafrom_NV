variable "key_name" {
  type = string 
  default = "NV_Mayank"
  description = "This is the North V. region key"
}

variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  type = list(string)
  default = [ "ami-0aa7d40eeae50c9a9", "ami-00874d747dde814fa","ami-08e637cea2f053dfa" ]

}

variable "az" {
  type = map
  default = {
    "az1" = "us-east-1a"
    "az2" = "us-east-1b"
    "az3" = "us-east-1c"
  }
}