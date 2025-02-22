variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
  default     = ["AnsibleServer", "AnsibleTarget", "DockerServer", "JenkinsServer"]
}

# EC2 Instance Variables
variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
  type        = string

}

variable "instance_name" {
  description = "Instance name"
  default     = "Instance"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string

}

variable "iam_role" {
  description = "The role of the instance type"
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instances"
  type        = string
}

variable "security_group_id" {
  description = "Subnet ID for EC2 instances"
  type        = list(string)
}



