
variable "db_name" {

  type        = string
  description = "database name"
  default     = "users"

}



variable "db_port" {

  type        = number
  description = "db port"
  default     = 5432

}


variable "cidr_block" {
  type        = string
  description = "cidr block"
  default     = "12.0.0.0/16"

}

variable "vpc_name" {

  type        = string
  description = "vpc name"
  default     = "postgres_vpc"

}


variable "private_subnets" {
   type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    private_a = {
      cidr = "12.0.1.0/24"
      az   = "ap-southeast-1a"
    }
    private_b = {
      cidr = "12.0.2.0/24"
      az   = "ap-southeast-1b"
    }
    
  }
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    public_a = {
      cidr = "12.0.3.0/24"
      az   = "ap-southeast-1a"
    }
    public_b = {
      cidr = "12.0.4.0/24"
      az   = "ap-southeast-1b"
    }
    
  }
}



variable "public_subnet_list" {
  type = list(string)
  default = []
}
variable "vpc_id" {
  type = string
  default = ""
}

variable "db_subnet_group_name" {
  type = string
  default = ""
}

## for list/tuple type use element
# variable "private_subnet_cidrs" {
#   type        = list(string)
#   description = "Private Subnet CIDR values"
#   default     = ["12.0.1.0/24", "12.0.2.0/24"]
# }

# variable "azs" {
#   type        = list(string)
#   description = "Availability Zones"
#   default     = ["ap-southeast-1a", "ap-southeast-1b"]
# }