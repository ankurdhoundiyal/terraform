resource "aws_subnet" "private" {
  vpc_id                    = "${var.vpc_id}"
  cidr_block                = "${length(var.azs) == length(var.private_subnets) ? element(var.private_subnets, count.index) : ""}"
  availability_zone         = "${element(var.azs, count.index)}"
  count                     = "${length(var.private_subnets)}"
  tags                      = "${merge(var.tags, map("Name", format("%s-subnet-private-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_subnet" "database" {
  vpc_id                    = "${var.vpc_id}"
  cidr_block                = "${length(var.azs) == length(var.database_subnets) ? element(var.database_subnets, count.index) : ""}"
  availability_zone         = "${element(var.azs, count.index)}"
  count                     = "${length(var.database_subnets)}"
  tags                      = "${merge(var.tags, map("Name", format("%s-database-subnet-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_route_table_association" "private" {
  count                     = "${length(var.private_subnets)}"
  subnet_id                 = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id            = "${var.private_route_tables[count.index]}"
}

resource "aws_route_table_association" "database" {
  count                     = "${length(var.database_subnets)}"
  subnet_id                 = "${element(aws_subnet.database.*.id, count.index)}"
  route_table_id            = "${var.private_route_tables[count.index]}"
}