# ALB Target variables
variable "project_tg_name"                 {                  }
variable "project_tg_port"                 { default = 80     }
variable "project_tg_protocol"             { default = "HTTP" }
variable "vpc_id"                          {                  }
variable "project_deregistration_delay"    { default = 120    }
variable "project_healthy_threshold"       { default = 3      }
variable "project_unhealthy_threshold"     { default = 2      }
variable "project_timeout"                 { default = 5      }
variable "project_interval"                { default = 10     }
variable "project_hc_port"                 { default = 80     }
variable "project_hc_protocol"             { default = "HTTP" }
variable "project_hc_path"                 { default = "/"    }
variable "tags"                            { default = {}     }