variable "test_vpc_cidr" {
    type = string
    default = "172.23.0.0/16"
}

variable "tag_name" {
    type = string
    default = "TEST-UAT-ENV"
}

variable "pub_subnet1a_cidr" {
    type = string
    default = "172.23.1.0/24" 
}

variable "pub_subnet1b_cidr"{
    type = string
    default = "172.23.2.0/24"
}

variable "priv_subnet1a_cidr" {
    type = string
    default = "172.23.3.0/24" 
}


variable "priv_subnet1b_cidr" {
    type = string
    default = "172.23.4.0/24" 
}
