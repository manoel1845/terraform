resource "aws_instance" "web-instance" {
  ami           = "${var.image_id}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.sg-web.id}"]
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