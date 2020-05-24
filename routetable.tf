resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "rta_public_a" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rta_public_c" {
  subnet_id      = aws_subnet.subnet_c.id
  route_table_id = aws_route_table.rt_public.id
}