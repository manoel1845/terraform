resource "aws_security_group" "sg-web" {
  name = "weg-sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web-instance" {
  ami           = var.image_id
  instance_type = var.instance_type
  security_groups = aws_security_group.sg_web.id
  subnet_id = aws_subnet.subnet_a.id
  availability_zone      = "${var.region}a"

  user_data = <<-EOF
    #!/bin/bash
    yum install -y httpd ; systemctl enable httpd
    echo "Hello, World" > index.html
    systemctl start httpd
    EOF

  tags = {
    Name = "web"
  }
}