# Security Group variables
variable "sg_name"              {}
variable "sg_description"       {}
variable "vpc_id"               {}
variable "type"                 { default = ["ingress", "ingress", "egress"]        }
variable "from_port"            { default = ["80", "443", "0"]                      }
variable "to_port"              { default = ["80", "443", "0"]                      }
variable "protocol"             { default = ["tcp", "tcp", "-1"]                    }
variable "sg_rule_description"  { default = ["Allow all traffic on port 80", "Allow all traffic on port 443", "Allow all outbound traffic"] }
variable "cidr_blocks"          { default = ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"] }
variable "sg_rule_count"        { default = 3                                       }
variable "tags"                 { default = {}                                      }