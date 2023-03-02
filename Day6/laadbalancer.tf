resource "aws_lb_target_group" "home-tg" {
  name = "home-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id 
  tags = {
    "Name" = "hometg"
  }

}

resource "aws_lb_target_group" "laptop-tg" {
  name = "laptop-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id 
  tags = {
    "Name" = "laptoptg"
  }

}

resource "aws_lb_target_group" "mobile-tg" {
  name = "mobile-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id 
  tags = {
    "Name" = "mobiletg"
  }
}

resource "aws_lb" "app_lb" {
    name = "application-load-balancer"
    load_balancer_type = "application"
    security_groups = [aws_security_group.tf-sg.id]
    subnets = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
  
}

resource "aws_lb_listener" "listner" {
  load_balancer_arn = aws_lb.app_lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.home-tg.arn
  }
}

resource "aws_lb_listener_rule" "rule1" {
  listener_arn = aws_lb_listener.listner.arn
  action {
       type = "forward"
       target_group_arn = aws_lb_target_group.laptop-tg.arn
  }
  condition {
    path_pattern {
      values = ["/laptop/*"]
    }
  }
}


resource "aws_lb_listener_rule" "rule2" {
  listener_arn = aws_lb_listener.listner.arn
  action {
       type = "forward"
       target_group_arn = aws_lb_target_group.mobile-tg.arn
  }
  condition {
    path_pattern {
      values = ["/mobile/*"]
    }
  }
}