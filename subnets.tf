resource "aws_subnet" "subnet_a" {
  vpc_id     = ["${aws_vpc.main.id}"]
  cidr_block = "10.10.10.0/25"
  availability_zone = "${var.region}a"

  tags = {
    Name = "AZ A"
  }
}

resource "aws_subnet" "subnet_c" {
  vpc_id     = ["${aws_vpc.main.id}"]
  cidr_block = "10.10.10.128/25"
  availability_zone = "${var.region}c"

  tags = {
    Name = "AZ C"
  }
}
