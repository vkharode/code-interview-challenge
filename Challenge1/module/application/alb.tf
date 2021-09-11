# Create security group for the application load balancer.

resource "aws_security_group" "test-project-alb-sg" {
  vpc_id = var.test_project_vpc_id
  
   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name  = "test-PROJECT-ALB-Security-Group"  
  } 
}

# Create Application Load Balancer
resource "aws_lb" "test-project-alb" {
    name = "TEST-PROJECT-ALB"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.test-project-alb-sg.id]
    subnets = [
      var.pub_subnet_1A,
      var.pub_subnet_1B
      ]
  enable_deletion_protection = false
  tags = {
    Name = "TEST-PROJECT-APP-LB"
  }
}

# Create ALB Listner - HTTPS
resource "aws_lb_listener" "test-project-alb-listener" {
  load_balancer_arn = aws_lb.test-project-alb.arn
  port = 443
  protocol = "HTTPS"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.test-project-alb-fetg.arn
  }
}

# Create ALB Listner Backend Rule - HTTPS

resource "aws_lb_listener_rule" "test-project-alb-listener" {
  listener_arn = aws_lb_listener.test-project-alb-listener.arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-project-alb-betg.arn
  }
    condition {
    path_pattern {
      values = ["/admin*"]
    }
  }
}




