variable "cidr" {
  type = map(sting)
  default = {
    "all" = "0.0.0.0/0"
    "vpc_cidr" = "20.0.0.0/16"
    "pub_cidr" = "20.0.16.0/24"
    "pri_cidr" = "20.0.32.0/24"
  }
}

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