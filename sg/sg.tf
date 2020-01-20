resource "aws_security_group" "sg" {
  name                = "${var.sg_name}"
  description         = "${var.sg_description}"
  vpc_id              = "${var.vpc_id}"
  tags                = "${merge(var.tags, map("Name", format("%s", var.sg_name)))}"
}

resource "aws_security_group_rule" "sg_rule" {
  type                = "${element(var.type, count.index)}"
  from_port           = "${element(var.from_port, count.index)}"
  to_port             = "${element(var.to_port, count.index)}"
  protocol            = "${element(var.protocol, count.index)}"
  cidr_blocks         = ["${element(var.cidr_blocks, count.index)}"]
  security_group_id   = "${aws_security_group.sg.id}"
  description         = "${element(var.sg_rule_description, count.index)}"
  count               = "${var.sg_rule_count}"
}