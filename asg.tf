resource "aws_autoscaling_group" "asg-web" {
  name                 = "autoscalinggroup-web"
  max_size             = 5
  min_size             = 2
  launch_configuration = "${aws_launch_configuration.foobar.name}"
  vpc_zone_identifier  = ["${aws_subnet.subnet-az-a.id}", "${aws_subnet.subnet-az-c.id}"]
}