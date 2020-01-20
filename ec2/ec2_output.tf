output "id"          {
  value = "${aws_instance.application.id}"
}

output "public_dns"  {
  value = "${aws_instance.application.public_dns}"
}

output "public_ip"   {
  value = "${aws_instance.application.public_ip}"
}

output "private_dns" {
  value = "${aws_instance.application.private_dns}"
}

output "private_ip"  {
  value = "${aws_instance.application.private_ip}"
}