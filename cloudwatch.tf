resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm_up" {
  alarm_name          = "ELB ScaleUp"
  alarm_description = "Scale up an instance when CPU utilization is greater than 80%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg-web.name
  }
  
  actions_enabled = true
  alarm_actions     = ["${aws_autoscaling_policy.asg_policy_scaleup.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm_down" {
  alarm_name          = "ELB ScaleDown"
  alarm_description = "Scale down an instance when CPU utilization is greater than 50%"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "50"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg-web.name
  }
  
  actions_enabled = true
  alarm_actions     = ["${aws_autoscaling_policy.asg_policy_scaledown.arn}"]
}