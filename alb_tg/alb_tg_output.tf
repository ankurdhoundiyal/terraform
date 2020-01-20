# Target Group output
output "project_target_group_id"          {
  value = "${aws_alb_target_group.project_alb_target_group.id}"
}

output "project_target_group_arn"         {
  value = "${aws_alb_target_group.project_alb_target_group.arn}"
}

output "project_target_group_arn_suffix"  {
  value = "${aws_alb_target_group.project_alb_target_group.arn_suffix}"
}