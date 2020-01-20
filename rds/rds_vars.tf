variable "rds_instance_identifier"     {
    description = "Custom name of the instance"
}

variable "rds_is_multi_az"             {
    description = "Set to true on production"
    default = false
}

variable "rds_storage_type"            {
    description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD)."
    default = "standard"
}

variable "rds_allocated_storage"       {
    description = "The allocated storage in GBs"
    # You just give it the number, e.g. 10
}

variable "rds_engine_type"             {
    description = "Database engine type"
}

variable "rds_engine_version"          {
    description = "Database engine version, depends on engine type"
}

variable "rds_instance_class"          {
    description = "Class of RDS instance"
}

variable "auto_minor_version_upgrade"  {
    description = "Allow automated minor version upgrade"
    default = true
}

variable "allow_major_version_upgrade" {
    description = "Allow major version upgrade"
    default = false
}

variable "database_name"               {
    description = "The name of the database to create"
}

variable "database_user"               {}
variable "database_password"           {}
variable "database_port"               {}

variable "db_parameter_group"          {
    description = "Parameter group, depends on DB engine used"
}

variable "publicly_accessible"         {
    description = "Determines if database can be publicly available (NOT recommended)"
    default = false
}

# RDS Subnet Group Variables
variable "subnets"                     {
    description = "List of subnets DB should be available at. It might be one subnet."
    type = "list"
}

variable "private_cidr"                {
    description = "VPC private addressing, used for a security group"
    type = "list"
}

variable "rds_vpc_id"                  {
    description = "VPC to connect to, used for a security group"
    type = "string"
}

variable "skip_final_snapshot"         {
    description = "If true (default), no snapshot will be made before deleting DB"
    default = true
}

variable "copy_tags_to_snapshot"       {
    description = "Copy tags from DB to a snapshot"
    default = true
}

variable "snapshot_identifier"          {
    default = ""
}

variable "backup_window"               {
    description = "When AWS can run snapshot, can't overlap with maintenance window"
    default = "22:00-03:00"
}

variable "apply_immediately"            {
    default = false
}

variable "monitoring_interval"            {
    default = 0
}

variable "backup_retention_period"     {
    type = "string"
    description = "How long will we retain backups"
    default = 0
}

variable "tags"                        { default = {} }

variable "statement_timeout" {
  description = "changing some values for parameters as in default subnet group"
  default = "60000"
}
variable "log_connections" {
  description = "changing some values for parameters as in default subnet group"
  default = "1"
}
variable "log_disconnections" {
  description = "changing some values for parameters as in default subnet group"
  default = "1"
}
variable "log_lock_waits" {
  description = "changing some values for parameters as in default subnet group"
  default = "1"
}
variable "log_temp_files" {
  description = "changing some values for parameters as in default subnet group"
  default = "0"
}
variable "log_autovacuum_min_duration" {
  description = "changing some values for parameters as in default subnet group"
  default = "0"
}
variable "log_statement" {
  description = "changing some values for parameters as in default subnet group"
  default = "none"
}
variable "log_min_duration_statement" {
  description = "changing some values for parameters as in default subnet group"
  default = "200"
}
