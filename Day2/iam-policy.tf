resource "aws_iam_role_policy" "admin_role_policy" {
  name = "tf-admin-policy"
  role = aws_iam_role.name.id
  policy = file("full-access.json")
}

resource "aws_iam_role" "name" {
  name = "admin-role"
  assume_role_policy = file("assume-role.json")
}

resource "aws_iam_instance_profile" "profile" {
  name = "profile-tf"
  role = aws_iam_role.name.name
}