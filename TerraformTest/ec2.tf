
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
  tags = merge(local.ec2_common_tags, ## Merge combines several maps to a single map
    {
      Name = each.key,
    }
  )

  vpc_security_group_ids = [aws_security_group.default_sg.id]

  user_data = templatefile("${path.module}/resources/user_data.sh.tmpl", {
    instance_name = each.key
  })
}

resource "aws_instance" "local_exec_provisioner_ec2_instance" {
  ami                  = var.ami_id
  iam_instance_profile = var.iam_role
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.main_subnet.id
  key_name             = var.ssh_key
  ## count=3
  tags = merge(local.ec2_common_tags, ## Merge combines several maps to a single map
    {
      Name = "LocalExecProvisionerTest",
    }
  )

  vpc_security_group_ids = [aws_security_group.default_sg.id]

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> servers_private_ip.txt && echo ${self.public_ip} >> servers_private_ip.txt"
  }

}

resource "aws_instance" "remote_exec_provisioner_ec2_instance" {
  ami                  = var.ami_id
  iam_instance_profile = var.iam_role
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.main_subnet.id
  key_name             = var.ssh_key
  ## count=3
  tags = merge(local.ec2_common_tags, ## Merge combines several maps to a single map
    {
      Name = "RemoteExecProvisionerTest",
    }
  )
  vpc_security_group_ids = [aws_security_group.default_sg.id]

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("../DevOpsKP.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install -y curl wget zip unzip gzip tar nano nginx",
      "sudo systemctl start nginx"
    ]
  }
}
