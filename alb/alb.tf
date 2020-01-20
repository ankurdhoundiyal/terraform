resource "aws_alb" "alb" {
  name                          = "${var.alb_name}"
  internal                      = "${var.alb_internal}" #false
  security_groups               = ["${var.alb_security_groups}"]
  subnets                       = ["${var.alb_subnets}"]
  idle_timeout                  = "${var.alb_idle_timeout}" #60
  ip_address_type               = "${var.alb_ip_address_type}" #ipv4

  access_logs {
    bucket                      = "${var.alb_access_log_bucket}"
    prefix                      = "${var.prefix}"
    enabled                     = "${var.enabled}"
  }

  tags                          = "${merge(var.tags, map("Name", format("%s", var.alb_name)))}"
}

resource "aws_alb_target_group" "alb_target_group" {
  name                          = "${var.name}"
  port                          = "${var.tg_port}"
  protocol                      = "${var.tg_protocol}"
  vpc_id                        = "${var.vpc_id}"
  deregistration_delay          = "${var.deregistration_delay}"

  health_check {
    healthy_threshold           = "${var.healthy_threshold}"
    unhealthy_threshold         = "${var.unhealthy_threshold}"
    timeout                     = "${var.timeout}"
    interval                    = "${var.interval}"
    port                        = "${var.hc_port}"
    protocol                    = "${var.hc_protocol}"
    path                        = "${var.hc_path}"
    matcher                     = "200"
  }

  tags                          = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_alb_listener" "alb_listener_https" {
  load_balancer_arn             = "${aws_alb.alb.arn}"
  port                          = 443
  protocol                      = "HTTPS"
  ssl_policy                    = "ELBSecurityPolicy-2016-08"
  certificate_arn               = "${var.certificate_arn}"

  default_action {
    target_group_arn            = "${aws_alb_target_group.alb_target_group.arn}"
    type                        = "forward"
  }
}

resource "aws_alb_listener" "alb_listener_http" {
  load_balancer_arn             = "${aws_alb.alb.arn}"
  port                          = 80
  protocol                      = "HTTP"

  default_action {
    target_group_arn            = "${aws_alb_target_group.alb_target_group.arn}"
    type                        = "forward"
  }
}
