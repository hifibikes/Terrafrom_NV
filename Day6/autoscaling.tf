resource "aws_launch_configuration" "alc_home" {
  name = "lc_home"
  image_id = var.ami[0]
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [aws_security_group.tf-sg.id]
  user_data = file("home.sh")
}

resource "aws_launch_configuration" "alc_laptop" {
  name = "lc_laptop"
  image_id = var.ami[0]
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [aws_security_group.tf-sg.id]
  user_data = file("laptop.sh")
}


resource "aws_launch_configuration" "alc_mobile" {
  name = "lc_mobile"
  image_id = var.ami[0]
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [aws_security_group.tf-sg.id]
  user_data = file("mobile.sh")
}

resource "aws_autoscaling_group" "aag_home" {
  name = "home-autoscaling-group"
  min_size = 1
  max_size = 5
  desired_capacity = 1 
  launch_configuration = aws_launch_configuration.alc_home.id
  vpc_zone_identifier = [aws_subnet.public_subnet.id]
}

resource "aws_autoscaling_group" "aag_laptop" {
  name = "laptop-autoscaling-group"
  min_size = 1
  max_size = 3
  desired_capacity = 1 
  launch_configuration = aws_launch_configuration.alc_laptop.id 
  vpc_zone_identifier = [aws_subnet.public_subnet.id]
}

resource "aws_autoscaling_group" "aag_mobile" {
  name = "mobile-autoscaling-group"
  min_size = 1
  max_size = 2
  desired_capacity = 1 
  launch_configuration = aws_launch_configuration.alc_mobile.id 
  vpc_zone_identifier = [aws_subnet.public_subnet.id]
}

resource "aws_autoscaling_attachment" "aaa_home" {
  autoscaling_group_name = aws_autoscaling_group.aag_home.id  
  alb_target_group_arn = aws_lb_target_group.home-tg.arn
}

resource "aws_autoscaling_attachment" "aaa_laptop" {
  autoscaling_group_name = aws_autoscaling_group.aag_laptop.id  
  alb_target_group_arn = aws_lb_target_group.laptop-tg.arn
}

resource "aws_autoscaling_attachment" "aaa_mobile" {
  autoscaling_group_name = aws_autoscaling_group.aag_mobile.id  
  alb_target_group_arn = aws_lb_target_group.mobile-tg.arn
}
