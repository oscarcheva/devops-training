# AWS Region for the Provider
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "sa-east-1"
}

# EC2 Instance Variables
variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
  type        = string

}

variable "instance_name" {
  description = "Instance name"
  default = "Instance"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default = "ami-015f3596bb2ef1aaa"

}

variable "ssh_key" {
  description = "The name of the SSH key pair"
  type        = string
  default = "DevOpsKP"

}

variable "iam_role" {
  description = "The role of the instance type"
  default = "s3BucketManager"
}

# S3 Bucket Variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "oscar-default-bucket"

}


