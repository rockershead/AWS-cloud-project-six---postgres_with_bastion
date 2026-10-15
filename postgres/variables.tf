
variable "db_name" {

  type        = string
  description = "database name"
  

}



variable "db_port" {

  type        = number
  description = "db port"
  

}

variable "vpc_name" {

  type        = string
  description = "vpc name"
  

}

variable "db_subnet_group_name" {
  type        = string
  description = "db subnet group name"
  
}


variable "private_subnets" {
   type = map(object({
    cidr = string
    az   = string
  }))
 
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
  
}

