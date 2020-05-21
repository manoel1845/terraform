resource "aws_subnet" "subnet-az-a" {
  vpc_id     = ["${aws_vpc.vpc-main.id}"]
  cidr_block = "10.10.10.0/25"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "AZ A"
  }
}

resource "aws_subnet" "subnet-az-c" {
  vpc_id     = ["${aws_vpc.vpc-main.id}"]
  cidr_block = "10.10.10.128/25"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "AZ C"
  }
}