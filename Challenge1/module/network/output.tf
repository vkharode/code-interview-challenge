output "test_project_vpc_id" {
    value = aws_vpc.test-project-vpc.id
}

output "public_subnet1A_id" {
    value = aws_subnet.test-project-pubsubnet1A.id
}

output "public_subnet1B_id" {
    value = aws_subnet.test-project-pubsubnet1B.id
}

output "private_subnet1A_id" {
    value = aws_subnet.test-project-privsubnet1A.id
}

output "private_subnet1B_id" {
    value = aws_subnet.test-project-privsubnet1B.id
}