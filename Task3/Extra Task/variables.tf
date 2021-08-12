variable "owner_id" {
  type    = string
  default = "370970544153"
}


variable "instance_type_amazonlinux" {
  type    = string
  default = "t2.micro"

}

variable "ami_amazonlinux" {
  type    = string
  default = "amazonlinuximage"
}

variable "instance_type_ubuntu" {
  type    = string
  default = "t2.micro"
}

variable "ami_ubuntu" {
  type    = string
  default = "Ubuntuimage"
}


variable "vpc_cidr_block" {
  type    = string
  default = "11.0.0.0/16"
}


variable "public_subnet_cidr_block" {
  type    = string
  default = "11.0.11.0/24"
}

variable "private_subnet_cidr_block" {
  type    = string
  default = "11.0.12.0/24"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC19xhCxMDi3/dNfreqEvrE6hb3k2b4RJBlSbmCNrQXyge5VHmWqxaqVeuPvaYcQaRH3yV02F3UCejUj+EERGp8G6CpQxNsCjbFNom9/SaXvPK6Y9kd0ztGipTYe6XTnxKqbZHaUjqnLoC/bGN7bBjVTZ73UPLV2yMKxTLnplevmyGNZhalysG92qirrxvcDonv1B1Lum/xDz190FqpFAje7ZOBTFatk0lffny7YC+YYPXi/tU/XwcejSddY5ljT/tiAynP/wH90BiMQoWyvw8Oa8KPz0/WKLl5EoiW6iVzoYSNCNDL9Lpbhg+VuKVWYk72uyznNKiBLROEByEl+PM3 exadel"
}

variable "public_key_name" {
  type    = string
  default = "exadel.pem"
}


