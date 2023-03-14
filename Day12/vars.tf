variable "port" {
  type= map(list(string))
  default = {
    "22" = ["49.36.58.107/32","172.31.1.0/24"]
    "443" = ["0.0.0.0/0"]
  }
}