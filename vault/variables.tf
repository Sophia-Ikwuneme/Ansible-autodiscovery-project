variable "aws_region" {
  default = "eu-west-2"
}
variable "profile" {
  default = "euteam-2"
}

variable "keypair_name" {
  default = "vault"
}
variable "cidr-all" {
  default = "0.0.0.0/0"
}
variable "sg-protocol" {
  default = "tcp"
}
variable "port_ssh" {
  default = 22
}
variable "port_vault" {
  default = 8200
}
variable "port_http" {
  default = 80
}
variable "port_https" {
  default = 443
}
variable "vault-ami" {
  default = "ami-08c3913593117726b"
}
variable "instance_type" {
  default = "t3.medium"
}
variable "domain_name" {
  default = "sophieplace.com"
}
variable "email" {
  default = "amibaby104@gmail.com"
}
variable "api_key" {
  default = "NRAK-46MTY3S6FXLGNX01GYBU09E62VO "
}
variable "account_id" {
  default = "4268773"
}
