resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "${var.vpc_name}_tf"
  }
}

resource "aws_subnet" "private" {
  for_each          = var.private_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
}


resource "aws_subnet" "public" {
  for_each          = var.public_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
}

## group for database subnets
resource "aws_db_subnet_group" "subnet_group" {
  
  name       = "${var.vpc_name}_rds_subnet_group"
  subnet_ids =  [for subnet in aws_subnet.private : subnet.id]

}

## making sure public subnets are connected to IGW or else they won't have internet access
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}_ig"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}