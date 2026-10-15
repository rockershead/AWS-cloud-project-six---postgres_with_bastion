
variable "cidr_block" {
  type        = string
  description = "cidr block"
  

}

variable "vpc_name" {

  type        = string
  description = "vpc name"
  

}


variable "private_subnets" {
   type = map(object({
    cidr = string
    az   = string
  }))
 
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
 
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