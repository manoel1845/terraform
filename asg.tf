resource "aws_autoscaling_policy" "asg_policy_scaleup" {
  name                   = "ASG Scaleup"
  scaling_adjustment     = "1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "300"
  autoscaling_group_name = aws_autoscaling_group.asg-web.name
}

resource "aws_autoscaling_policy" "asg_policy_scaledown" {
  name                   = "ASG Scaledown"
  scaling_adjustment     = "-1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "300"
  autoscaling_group_name = aws_autoscaling_group.asg-web.name
}

resource "aws_launch_configuration" "lauch_config" {
  name_prefix   = "terraform-lc-example-"
  image_id      = var.image_id
  instance_type = var.instance_type
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg-web" {
  name                 = "autoscaling-group-web"
  launch_configuration = aws_launch_configuration.lauch_config.name
  vpc_zone_identifier  = ["${aws_subnet.subnet_a.id}", "${aws_subnet.subnet_c.id}"]
  max_size             = 3
  min_size             = 1
  health_check_grace_period = 300
  health_check_type = "ELB"
  force_delete = true
  target_group_arns = ["${aws_lb_target_group.elb-tg}"]
}

