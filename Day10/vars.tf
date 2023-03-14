variable "list1" {
  type = list(string)
  default = [ 10,20,22,33]
}

variable "map1" {
  type = map(number)
  default = {
    "aaple" = 3
    "pear" = 5
    "banana" = 7
    "mango" = 0
  }
}