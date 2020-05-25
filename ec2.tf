resource "aws_instance" "web-instance" {
  ami           = var.image_id
  instance_type = var.instance_type
  security_groups = aws_security_group.sg-web.id
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