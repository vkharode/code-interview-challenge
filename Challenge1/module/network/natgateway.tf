# Create EIP's to associate with the NAT Gateways-

resource "aws_eip" "test-project-nateip-privsub1A" {
  tags = {
    "Name" = "TEST-PROJECT-NATEIP-PRIVSUB1A"
  }
}

resource "aws_eip" "test-project-nateip-privsub1B" {
 tags = {
     "Name" = "TEST-PROJECT-NATEIP-PRIVSUB1B"
 } 
}


# Crate NAT Gateway for resources in private subnet to talk to the Internet or other AWS Services.associate_with_private_ip

resource "aws_nat_gateway" "test-project-natgw-privsub1A" {
  allocation_id = aws_eip.test-project-nateip-privsub1A.id
  subnet_id = aws_subnet.test-project-privsubnet1A.id

  tags = {
    "Name" = "TEST-PROJECT-NATGW-1A"
  }
}


resource "aws_nat_gateway" "test-project-natgw-privsub1B" {
  allocation_id = aws_eip.test-project-nateip-privsub1B.id
  subnet_id = aws_subnet.test-project-privsubnet1B.id

  tags = {
    "Name" = "TEST-PROJECT-NATGW-1B"
  }
}
