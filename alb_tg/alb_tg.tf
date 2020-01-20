resource "aws_alb_target_group" "project_alb_target_group" {
  name                          = "${var.project_tg_name}"
  port                          = "${var.project_tg_port}"
  protocol                      = "${var.project_tg_protocol}"
  vpc_id                        = "${var.vpc_id}"
  deregistration_delay          = "${var.project_deregistration_delay}"

  health_check {
    healthy_threshold           = "${var.project_healthy_threshold}"
    unhealthy_threshold         = "${var.project_unhealthy_threshold}"
    timeout                     = "${var.project_timeout}"
    interval                    = "${var.project_interval}"
    port                        = "${var.project_hc_port}"
    protocol                    = "${var.project_hc_protocol}"
    path                        = "${var.project_hc_path}"
    matcher                     = "200"
  }

  tags                          = "${merge(var.tags, map("Name", format("%s", var.project_tg_name)))}"
}