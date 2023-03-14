variable "project_tag" {
  type = map(string)
  default = {
    "Component" = "Frontend"
    "Environment" = "Prod"
  }
}