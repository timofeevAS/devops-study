variable "username" {
  type        = string
  sensitive   = true
}

variable "userpassword" {
  type        = string
  sensitive   = true
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