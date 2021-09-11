 # Create Security Group for ASG
resource "aws_security_group" "test-project-asg-sg" {
  vpc_id = var.test_project_vpc_id
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
 ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [
      var.aws_alb_sg_id
    ]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [
      var.aws_alb_sg_id
    ]
  }
  tags = {
    Name = "TEST-PROJECT-ASG-Security-Group"
  } 
}

# Create Launch Configuration
resource "aws_launch_configuration" "test-project-asg-launch-config" {
  name_prefix   = "TEST-PROJECT-ASG-Launch-Configuration"
  image_id      = var.asg_image_id
  instance_type = var.asg_instance_type
  security_groups = [aws_security_group.test-project-asg-sg.id]
  key_name = "Migration"
  lifecycle {
    create_before_destroy = true
  }
}

# Create DFSC FrontEnd ASG
resource "aws_autoscaling_group" "test-project-asg-fe" {
  name                 = "TEST-PROJECT-ASG-FE-Pre"
  launch_configuration = aws_launch_configuration.test-project-asg-launch-config.name
  health_check_type    = "ELB"
  min_size             = 0
  max_size             = 0
  desired_capacity     = 0

  vpc_zone_identifier = [
    var.private_subnet_1A,
    var.private_subnet_1B
  ]
  target_group_arns = [var.aws_alb_fe_arn]
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "TEST-PROJECT-ASG-FE"
    propagate_at_launch = true  
  }
}

# Create DFSC Backend ASG

resource "aws_autoscaling_group" "test-project-asg-be" {
  name                 = "TEST-PROJECT-ASG-BE-Pre"
  launch_configuration = aws_launch_configuration.test-project-asg-launch-config.name
  health_check_type    = "ELB"
  min_size             = 0
  max_size             = 0
  desired_capacity     = 0

  vpc_zone_identifier = [
    var.private_subnet_1A,
    var.private_subnet_1B
  ]
  target_group_arns = [var.aws_alb_be_arn]
  lifecycle {
    create_before_destroy = true
  }
 tag {
    key                 = "Name"
    value               = "TEST-PROJECT-ASG-BE"
    propagate_at_launch = true  
  }
}