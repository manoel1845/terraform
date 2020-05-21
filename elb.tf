
resource "aws_elb" "elb" {
  name = "${var.name}"
  security_groups = "${aws_security_group.sg-elb.id}"
  cross_zone_load_balancing = true
  instances = "${aws_instance.web-instance.id}"

  listener {
    instance_port = "80"
    instance_protocol = "tcp"
    lb_port = "80"
    lb_protocol = "tcp"
  }
}