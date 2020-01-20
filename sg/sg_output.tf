output "id"          {
  value = "${aws_security_group.sg.id}"
}

output "name"        {
  value = "${aws_security_group.sg.name}"
}

output "description" {
  value = "${aws_security_group.sg.description}"
}

output "vpc_id"      {
  value = "${aws_security_group.sg.vpc_id}"
}