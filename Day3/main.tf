resource "aws_s3_bucket" "s3-bkt" {
    bucket = var.bkt_name
    tags = {
      "Env" = "dev"
    }
    acl    = "private"
    versioning {
    enabled = true
  }
    
}