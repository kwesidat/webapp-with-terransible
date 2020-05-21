variable "aws_region" {
    default = "eu-west-2"
}
variable "instance_type" {
    default = "t2.small"
}
variable "instance_name" {
    default = "webapp_instance"
}
variable "ami_id" {
    default = "ami-01a6e31ac994bbc09"
}
variable "ssh_user_name" {
    default = "ec2-user"
}
variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "subnets_cidr" {
	type = "list"
	default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "azs" {
	type = "list"
	default = ["eu-west-2a", "eu-west-2b"]
}

variable "ssh_key_name" {
    default = "webapp"
}
variable "ssh_key_path" {
    default = "~/Desktop/ssh/webapp.pem"
}
variable "instance_count" {
    default = 1
}
variable "subnet_id" {
    default = "subnet-d08ce8b9"
}
variable "dev_host_label" {
    default = "terra_ansible_host"
}
