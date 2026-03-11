resource "aws_instance" "demo_ec2" {
  ami           = "ami-0f559c3642608c138"
  instance_type = var.instance_type
  count         = var.instance_count

  monitoring = var.enable_monitoring

  tags = {
    Name = var.instance_name
  }
}
