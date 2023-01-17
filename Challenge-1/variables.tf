# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
# Defining CIDR Block for web Subnet 1
variable "subnetweb1_cidr" {
  default = "10.0.1.0/24"
}
# Defining CIDR Block for web Subnet 2
variable "subnetweb2_cidr" {
  default = "10.0.2.0/24"
}
# Defining CIDR Block for application Subnet 1
variable "subnetapp1_cidr" {
  default = "10.0.3.0/24"
}
# Defining CIDR Block for application Subnet 2
variable "subnetapp2_cidr" {
  default = "10.0.4.0/24"
}
# Defining CIDR Block for rds Subnet 1
variable "subnetdb1_cidr" {
  default = "10.0.5.0/24"
}
# Defining CIDR Block for rds Subnet 2
variable "subnetdb2_cidr" {
  default = "10.0.6.0/24"
}