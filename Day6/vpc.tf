resource "aws_vpc" "main" {
  cidr_block = var.cidr["vpc_cidr"]
  tags = {
    "Name" = "TF-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cicr["pub_cidr"] 
  availability_zone = var.az["az1"]
  tags = {
    "Name" = "Public-Subnet"
  }
  map_public_ip_on_launch = true

}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.cicr["pri_cidr"] 
  availability_zone = var.az["az2"]
  tags = {
    "Name" = "Private-Subnet"
  }

}

resource "aws_internet_gateway" "aig" {
    vpc_id = aws_vpc.main.id
    tags = {
      "Name" = "igw"
    }
}

resource "aws_route_table" "main-art" {
   vpc_id = aws_vpc.main.id
   tags = {
     "Name" = "main-rt"
   }
}

resource "aws_route_table_association" "arta" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.main-art.id 
}

resource "aws_route" "ar" {
   route_table_id = aws_route_table.main-art.id 
   destination_cidr_block = var.cidr["all"]
   gateway_id = aws_internet_gateway.aig.id 
}

resource "aws_eip" "aeip" {
  tags = {
    "Name" = "eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.aeip.id
  subnet_id = aws_subnet.private_subnet.id
  tags = {
    "name" = "Nat-gw"
  }
}

resource "aws_route_table" "art2" {
  vpc_id = aws_vpc.main.id 
  tags = {
    "name" = "rt2"
  }
  route {
    cidr_block = var.cidr["all"]
    nat_gateway_id = aws_nat_gateway.nat.id 
  }
}

resource "aws_route_table_association" "arta2" {
  subnet_id = aws_instance.private_ec2.id
  route_table_id = aws_route_table.art2.id 
}




