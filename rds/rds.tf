resource "aws_db_instance" "main_rds_instance" {
    identifier                      = "${var.rds_instance_identifier}"
    allocated_storage               = "${var.rds_allocated_storage}"
    engine                          = "${var.rds_engine_type}"
    engine_version                  = "${var.rds_engine_version}"
    instance_class                  = "${var.rds_instance_class}"
    name                            = "${var.database_name}"
    username                        = "${var.database_user}"
    password                        = "${var.database_password}"

    port                            = "${var.database_port}"
    # Because we're assuming a VPC, we use this option, but only one SG id
    vpc_security_group_ids          = ["${aws_security_group.main_db_access.id}"]

    # We're creating a subnet group in the module and passing in the name
    db_subnet_group_name            = "${aws_db_subnet_group.main_db_subnet_group.name}"
    parameter_group_name            = "${aws_db_parameter_group.main_rds_instance.id}"

    # We want the multi-az setting to be toggleable, but off by default
    multi_az                        = "${var.rds_is_multi_az}"
    storage_type                    = "${var.rds_storage_type}"
    publicly_accessible             = "${var.publicly_accessible}"

    # Upgrades
    allow_major_version_upgrade     = "${var.allow_major_version_upgrade}"
    auto_minor_version_upgrade      = "${var.auto_minor_version_upgrade}"

    # Snapshots and backups
    skip_final_snapshot             = "${var.skip_final_snapshot}"
    copy_tags_to_snapshot           = "${var.copy_tags_to_snapshot}"

    snapshot_identifier             = "${var.snapshot_identifier}"
    backup_retention_period         = "${var.backup_retention_period}"
    backup_window                   = "${var.backup_window}"
    apply_immediately               = "${var.apply_immediately}"
    monitoring_interval             = "${var.monitoring_interval}"

    tags                            = "${merge(var.tags, map("Name", format("%s", var.rds_instance_identifier)))}"
}

resource "aws_db_parameter_group" "main_rds_instance" {
    name                            = "${var.rds_instance_identifier}-${replace(var.db_parameter_group, ".", "")}-custom-params"
    family                          = "${var.db_parameter_group}"
    tags                            = "${merge(var.tags, map("Name", format("%s-%s", var.rds_instance_identifier, replace(var.db_parameter_group, ".", ""))))}"

    parameter {
      name  = "statement_timeout"
      value = "${var.statement_timeout}"
    }
    parameter {
      name  = "log_connections"
      value = "${var.log_connections}"
    }
    parameter {
      name  = "log_disconnections"
      value = "${var.log_disconnections}"
    }
    parameter {
      name  = "log_lock_waits"
      value = "${var.log_lock_waits}"
    }
    parameter {
      name  = "log_temp_files"
      value = "${var.log_temp_files}"
    }
    parameter {
      name  = "log_autovacuum_min_duration"
      value = "${var.log_autovacuum_min_duration}"
    }
    parameter {
      name  = "log_statement"
      value = "${var.log_statement}"
    }
    parameter {
      name  = "log_min_duration_statement"
      value = "${var.log_min_duration_statement}"
    }
  }

resource "aws_db_subnet_group" "main_db_subnet_group" {
    name                            = "${var.rds_instance_identifier}-subnetgrp"
    description                     = "RDS subnet group"
    subnet_ids                      = ["${var.subnets}"]
    tags                            = "${merge(var.tags, map("Name", format("%s-subnetgrp", var.rds_instance_identifier)))}"
}

resource "aws_security_group" "main_db_access" {
    name                            = "${var.rds_instance_identifier}-access"
    description                     = "Allow access to the database"
    vpc_id                          = "${var.rds_vpc_id}"
    tags                            = "${merge(var.tags, map("Name", format("%s-access", var.rds_instance_identifier)))}"
}

resource "aws_security_group_rule" "allow_db_access" {
    type                            = "ingress"
    from_port                       = "${var.database_port}"
    to_port                         = "${var.database_port}"
    protocol                        = "tcp"
    cidr_blocks                     = ["${var.private_cidr}"]
    security_group_id               = "${aws_security_group.main_db_access.id}"
}

resource "aws_security_group_rule" "allow_all_outbound" {
    type                            = "egress"
    from_port                       = 0
    to_port                         = 0
    protocol                        = "-1"
    cidr_blocks                     = ["0.0.0.0/0"]
    security_group_id               = "${aws_security_group.main_db_access.id}"
}
