output "id"                       {
  value = "${aws_alb.alb.id}"
}

output "arn"                      {
  value = "${aws_alb.alb.arn}"
}

output "arn_suffix"               {
  value = "${aws_alb.alb.arn_suffix}"
}

output "dns_name"                 {
  value = "${aws_alb.alb.dns_name}"
}

output "canonical_hosted_zone_id" {
  value = "${aws_alb.alb.canonical_hosted_zone_id}"
}

output "zone_id"                  {
  value = "${aws_alb.alb.zone_id}"
}

# Target Group output
output "target_group_id"          {
  value = "${aws_alb_target_group.alb_target_group.id}"
}

output "target_group_arn"         {
  value = "${aws_alb_target_group.alb_target_group.arn}"
}

output "target_group_arn_suffix"  {
  value = "${aws_alb_target_group.alb_target_group.arn_suffix}"
}

# Listener output - HTTPS
output "listener_id_https"              {
  value = "${aws_alb_listener.alb_listener_https.id}"
}

output "listener_arn_https"             {
  value = "${aws_alb_listener.alb_listener_https.arn}"
}

# Listener output - HTTP
output "listener_id_http"              {
  value = "${aws_alb_listener.alb_listener_http.id}"
}

output "listener_arn_http"             {
  value = "${aws_alb_listener.alb_listener_http.arn}"
}