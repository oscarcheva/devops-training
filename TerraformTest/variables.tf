
# AWS Region for the Provider
variable "aws_region" {
  description = "AWS Region"
  type        = string
}


variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string

}

variable "iam_role" {
  description = "The role of the instance type"
}

# S3 Bucket Variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-tf-bucket"

}

