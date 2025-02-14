variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
  default     = ["AnsibleServer", "AnsibleTarget", "DockerServer", "JenkinsServer"]
}

locals {
  ec2_common_tags = {
    Environment = "Test",
    Owner       = "Oscar"
    LastUpdate  = "(UY Time) - ${formatdate("DD-MMM-YYYY hh:mm", timeadd(timestamp(), "-3h"))}"
  }
}

resource "aws_instance" "ec2_instance" {
  for_each             = toset(var.instance_names)
  ami                  = var.ami_id == "123" ? "ami.123" : var.ami_id # Just to test conditional expressions.
  iam_instance_profile = var.iam_role
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.main_subnet.id
  key_name             = var.ssh_key
  ## count=3
  tags = merge(local.ec2_common_tags, ##Merge combines several maps to a single map
    {
      Name = each.key,
    }
  )

  vpc_security_group_ids = [aws_security_group.default_sg.id]

  user_data = templatefile("${path.module}/user_data.sh.tmpl", {
    instance_name = each.key
  })
}