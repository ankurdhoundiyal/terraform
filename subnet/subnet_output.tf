output "private_subnets"           {
  value = ["${aws_subnet.private.*.id}"]
}

output "database_subnets"          {
  value = ["${aws_subnet.database.*.id}"]
}