resource "aws_instance" "web-instance" {
  ami           = "ami-03e1e4abf50e14ded"
  instance_type = "t2.micro"
  vpc_security_group_ids = "${aws_security_group.sg-web.id}"
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