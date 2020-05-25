resource "aws_instance" "web-instance" {
  ami           = var.image_id
  instance_type = var.instance_type
  subnet_id = aws_sunet.subnet_a.id
  availability_zone      = "${var.region}b"

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