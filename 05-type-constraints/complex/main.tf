resource "aws_instance" "demo_ec2" {
  ami           = "ami-0f559c3642608c138"
  instance_type = var.server_settings.instance_type
  count         = length(var.instance_names)

  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  monitoring = var.server_settings.monitoring

  tags = merge(
    var.instance_tags,
    { Name = var.instance_names[count.index] }
  )

  root_block_device {
    volume_size = var.server_settings.volume_size
  }
}

resource "aws_security_group" "demo_sg" {
  name        = "demo-security-group"
  description = "Simple security group"
  vpc_id      = "vpc-0f12d49c3183da79b" # default vpc id

  dynamic "ingress" {
    for_each = var.security_rules

    content {
      description = ingress.key
      from_port   = ingress.value
      to_port   = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Demo_SG_EC2"
  }
}
