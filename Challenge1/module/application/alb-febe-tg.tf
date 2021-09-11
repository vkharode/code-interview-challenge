# Create Frontend Target Group
resource "aws_lb_target_group" "test-project-alb-fetg" {
  port = 80
  protocol = "HTTP"
  name = "test-project-alb-target-group"
  vpc_id = var.test_project_vpc_id
  stickiness {
    type = "lb_cookie"
    enabled = true
  }
  health_check {
    protocol = "HTTP"
    path = "/healthy.html"
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 10
  }
  tags = {
    Name = "TEST-PROJECT-FRONT-END-TARGET-GROUP"  
  } 
}

# Create Backend Target Group
resource "aws_lb_target_group" "test-project-alb-betg" {
  port = 80
  protocol = "HTTP"
  name = "test-project-alb-target-group"
  vpc_id = var.test_project_vpc_id
  stickiness {
    type = "lb_cookie"
    enabled = true
  }
  health_check {
    protocol = "HTTP"
    path = "/healthy.html"
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 10
  }
  tags = {
    Name  = "TEST-PROJECT-BACK-END-TARGET-GROUP"
  } 
}