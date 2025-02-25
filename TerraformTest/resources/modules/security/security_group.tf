resource "aws_security_group" "default_sg" {
  name        = "Default security group for new instances"
  description = "Allow basic comms for new servers"
  vpc_id      = var.main_vpc_id

  tags = {
    Name = "default-sg"
    type = "security-group"
  }

/*  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port         = port.value
      protocol          = "tcp"
      to_port           = port.value
    }
  }*/
}

output "security_group_id" {
  value = aws_security_group.default_sg.id
}

resource "aws_security_group_rule" "ssh_access" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.default_sg.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh_access_whitelisted_remote_state_ip_address" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.default_sg.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["${data.terraform_remote_state.remote_state_data_source.outputs.eip_lb}/32"]
}

resource "aws_security_group_rule" "http_access" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.default_sg.id
  to_port           = 80
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


