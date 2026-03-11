variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
  default     = ["web-1", "web-2"]
}

variable "instance_tags" {
  description = "Map of tags applied to the instance"
  type        = map(string)

  default = {
    Environment = "dev"
    Project     = "terraform-demo"
  }
}

variable "instance_config" {
  description = "Tuple containing instance configuration"
  type        = tuple([string, number, bool])

  default = ["t3.micro", 20, true]
}

variable "server_settings" {
  description = "Object representing structured server settings"

  type = object({
    instance_type = string
    monitoring    = bool
    volume_size   = number
  })

  default = {
    instance_type = "t3.micro"
    monitoring    = true
    volume_size   = 20
  }
}

variable "security_rules" {
  type = map(number)

  default = {
    SSH = 22
    HTTP = 80
    HTTPS = 443
  }
}