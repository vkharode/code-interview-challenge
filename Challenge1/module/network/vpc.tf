# create a VPC for test project

resource "aws_vpc" "test-project-vpc" {
    cidr_block = var.test_vpc_cidr
    instance_tenancy = "default"
    tags = {
      "Name" = var.tag_name
    }
}

resource "aws_iam_role" "test-project-iam-role" {
  name = "TEST-IAM-ROLE"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "test-project-iam-policy" {
  name = "TEST-IAM-POLICY"
  role = aws_iam_role.test-project-iam-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_cloudwatch_log_group" "test-project-log-group" {
  name = "TEST-LOG-GRP"
}

resource "aws_flow_log" "test-project-vpc-flowlog" {
  iam_role_arn    = aws_iam_role.test-project-iam-role.arn
  log_destination = aws_cloudwatch_log_group.test-project-log-group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.test-project-vpc.id
  tags = {
    "Name" = "TEST-PROJECT-LOGS"
  }
  depends_on = [
    aws_vpc.test-project-vpc, aws_cloudwatch_log_group.test-project-log-group, aws_iam_role.test-project-iam-role
  ]
}

resource "aws_internet_gateway" "test-project-igw" {
  vpc_id = aws_vpc.test-project-vpc.id
  tags = {
    "Name" = "TEST-PROJECT-IGW"
  }
}


