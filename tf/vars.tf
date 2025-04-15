# export TF_VAR_username=
variable "username" {
}
# export TF_VAR_userpassword=
variable "userpassword" {
}


variable "image_name" {
  type    = string
  default = "ununtu-22.04"
}

#### VM parameters
variable "server_flavor" {
  type    = string
  default = "m1.small"
}

variable "key_pair" {
  default = "timofeevssh"
}

variable "security_group" {
  default = "default"
}

variable "network_name" {
  default = "sutdents-net"
}