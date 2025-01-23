provider "aws" {
  region = var.aws_region
}

variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
  default     = ["AnsibleServer", "AnsibleTarget", "DockerServer", "JenkinsServer"]
}

resource "aws_instance" "ec2_instance" {
  for_each             = toset(var.instance_names)
  ami = var.ami_id
  iam_instance_profile = var.iam_role
  instance_type = var.instance_type
  subnet_id = aws_subnet.main_subnet.id
  key_name = var.ssh_key
  tags = {
    Name = each.key
  }
  vpc_security_group_ids = [aws_security_group.default_sg.id]

  user_data = templatefile("${path.module}/user_data.sh.tmpl", {
    instance_name = each.key
  })
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Main VPC"
  }
}

resource "aws_subnet" "main_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main Subnet"
  }
}


# Security Group Module

resource "aws_security_group" "default_sg" {
  name = "Default security group for new instances"
  description = "Allow basic comms for new servers"
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "default-sg"
    type = "security-group"
  }
}

resource "aws_security_group_rule" "ssh_access" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.default_sg.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_traffic" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.default_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
}

resource "aws_route_table_association" "main_rt_assoc" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_rt.id
}




