variable "vpc_id"                     {}
variable "name"                     {}

variable "azs"                      {
  description = "A list of Availability zones in the region"
  default     = []
}

variable "private_subnets"          {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "database_subnets"         {
  type        = "list"
  description = "A list of database subnets"
  default     = []
}

variable "tags"                     {
  description = "A map of tags to add to all resources"
  default     =                     {}
}

variable "private_route_tables"     {
  description = "A list of private subnets inside the VPC."
  default     = []
}