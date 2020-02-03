variable "region" {
  description = "Region for the VPC"
  default     = "sa-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}
