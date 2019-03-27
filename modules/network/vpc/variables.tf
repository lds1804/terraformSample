## VPC SETUP
variable "vpc_cidr_prefix" {
  type = "map"
  default = {
    "development" = "10.2"
    "production" = "10.3"
  }
}
variable "vpc_cidr_suffix" {
  type = "map"
  default = {
    "development" = "0.0/16"
    "production" = "0.0/16"
  }
}
