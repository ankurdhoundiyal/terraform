# ALB variables
variable "alb_name"             {                  }
variable "alb_internal"         { default = false  }
variable "alb_security_groups"  { default = []     }
variable "alb_subnets"          { default = []     }
variable "alb_idle_timeout"     { default = 60     }
variable "alb_ip_address_type"  { default = "ipv4" }
variable "tags"                 { default = {}     }

# Access Logs variables
variable "alb_access_log_bucket" {                 }
variable "prefix"               { default = ""     }
variable "enabled"              { default = true   }

# ALB Target variables
variable "name"                 {                  }
variable "tg_port"              { default = 80     }
variable "tg_protocol"          { default = "HTTP" }
variable "vpc_id"               {                  }
variable "deregistration_delay" { default = 120    }
variable "healthy_threshold"    { default = 3      }
variable "unhealthy_threshold"  { default = 2      }
variable "timeout"              { default = 5      }
variable "interval"             { default = 10     }
variable "hc_port"              { default = 80     }
variable "hc_protocol"          { default = "HTTP" }
variable "hc_path"              { default = "/"    }

# ELB variables
variable "certificate_arn"      {                  }