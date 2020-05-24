
resource "aws_elb" "elb" {
  name = "elb_web"
  security_groups = aws_security_group.sg-elb.id
  cross_zone_load_balancing = true
  subnets = ["${aws_subnet.subnet_a.elb.id}", "${aws_subnet.subnet_c.elb.id}"]
 # instances = ["${aws_instance.web-instance.id}"]

  listener {
    instance_port = "80"
    instance_protocol = "tcp"
    lb_port = "80"
    lb_protocol = "tcp"
  }
}

resource "aws_lb_target_group" "elb-tg" {
  name     = "elb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-main.id

  health_check = {
    path = "/"
    health_threshold = 2
  }
}

resource "aws_lb_listener" "elb_listener" {
  load_balancer_arn = aws_lb.elb_listener.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb-tg.arn
  }
}