resource "aws_ebs_volume" "ebs_vol" {
  availability_zone = "us-east-1a"
  size = 8
  tags = { for k,v in merge({ Name = "myvol"}, var.project_tag): k => lower(v)  }
}