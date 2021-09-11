# Create a  route table for Public subnets.

resource "aws_route_table" "test-project-pubroutetable" {
    vpc_id = aws_vpc.test-project-vpc.id
    route = [ {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.test-project-igw.id
      carrier_gateway_id = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id = ""
      instance_id = ""
      ipv6_cidr_block = ""
      local_gateway_id = ""
      nat_gateway_id = ""
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    } ]
    tags = {
      "Name" = "TEST-PROJECT-PUBLIC-ROUTETABLE "
    }
}

# Create a  route table for Private subnets.

resource "aws_route_table" "test-project-privroutetable" {
    vpc_id = aws_vpc.test-project-vpc.id
    route = [ {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.test-project-natgw-privsub1A.id
      carrier_gateway_id = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id = ""
      instance_id = ""
      ipv6_cidr_block = ""
      local_gateway_id = ""
      nat_gateway_id = ""
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    } ]
    tags = {
      "Name" = "TEST-PROJECT-PRIVATE-ROUTETABLE "
    }
}

# Attach a public route table to Public Subnets

resource "aws_route_table_association" "test-project-pubroutetable1-association" {
  subnet_id = aws_subnet.test-project-pubsubnet1A.id
  route_table_id = aws_route_table.test-project-pubroutetable.id
}

resource "aws_route_table_association" "test-project-pubroutetable2-association" {
  subnet_id = aws_subnet.test-project-pubsubnet1B.id
  route_table_id = aws_route_table.test-project-pubroutetable.id
}


# Attach a private route table to Private Subnets

resource "aws_route_table_association" "test-project-privroutetable1-association" {
  subnet_id = aws_subnet.test-project-privsubnet1A.id
  route_table_id = aws_route_table.test-project-privroutetable.id
}

resource "aws_route_table_association" "test-project-privroutetable2-association" {
  subnet_id = aws_subnet.test-project-privsubnet1B.id
  route_table_id = aws_route_table.test-project-privroutetable.id
}