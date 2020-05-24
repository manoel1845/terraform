resource "aws_lb" "elb" {
  name               = "elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = aws_security_group.sg-elb.id
  subnets            = ["aws_subnet.subnet_a.elb.id", "aws_subnet.subnet_c.elb.id"]

  enable_deletion_protection = false

}

resource "aws_lb_listener" "elb_listener" {
  load_balancer_arn = aws_lb.elb_listener.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb-tg.arn
  }
}

resource "aws_lb_target_group" "elb-tg" {
  name     = "elb-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}