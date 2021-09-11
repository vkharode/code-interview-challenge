output "aws_alb_fe_arn" {
    value = aws_lb_target_group.test-project-alb-fetg.arn
}

output "aws_alb_be_arn" {
    value = aws_lb_target_group.test-project-alb-betg.arn
}

output "aws_alb_sg_id" {
    value = aws_security_group.test-project-alb-sg.id
}