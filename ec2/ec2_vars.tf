# EC2 variables
variable "instance_name"               {                 }
variable "ami"                         {                 }
variable "availability_zone"           {                 }
variable "ebs_optimized"               { default = true  }
variable "instance_type"               {                 }
variable "key_name"                    {                 }
variable "monitoring"                  { default = true  }
variable "security_group_ids"          { default = []    }
variable "subnet_id"                   {                 }
variable "associate_public_ip_address" { default = true  }
variable "iam_instance_profile"        {                 }
variable "user_data"                   { default = ""    }
variable "user_data_source"            { default = ""    }
variable "tags"                        { default = {}    }