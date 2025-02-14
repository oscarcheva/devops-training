resource "aws_security_group" "default_sg" {
  name        = "Default security group for new instances"
  description = "Allow basic comms for new servers"
  vpc_id      = aws_vpc.main_vpc.id

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