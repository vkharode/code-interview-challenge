# Create public subnets in eu-west-1a and and eu-west-1b

resource "aws_subnet" "test-project-pubsubnet1A" {
  vpc_id = aws_vpc.test-project-vpc.id
  cidr_block = var.pub_subnet1a_cidr
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = "true"
  tags = {
    "Name" = "TEST-PROJECT-PUBSUBNET1A"
     Terraform = "True"
  }
}

resource "aws_subnet" "test-project-pubsubnet1B" {
  vpc_id = aws_vpc.test-project-vpc.id
  availability_zone = "eu-west-1b"
  cidr_block = var.pub_subnet1b_cidr
  map_public_ip_on_launch = "true"
  tags = {
    "Name" = "TEST-PROJECT-PUBSUBNET1B"
     Terraform = "True"
  }
}


# Create private subnets in eu-west-1a and and eu-west-1b

resource "aws_subnet" "test-project-privsubnet1A" {
  vpc_id = aws_vpc.test-project-vpc.id
  cidr_block = var.priv_subnet1a_cidr
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = "false"
  tags = {
    "Name" = "TEST-PROJECT-PRIVSUBNET1A"
     Terraform = "True"
  }
}

resource "aws_subnet" "test-project-privsubnet1B" {
  vpc_id = aws_vpc.test-project-vpc.id
  availability_zone = "eu-west-1b"
  cidr_block = var.priv_subnet1b_cidr
  map_public_ip_on_launch = "false"
  tags = {
    "Name" = "TEST-PROJECT-PRIVSUBNET1B"
     Terraform = "True"
  }
}