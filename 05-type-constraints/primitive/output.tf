output "instance_ids" {
  description = "IDs of created EC2 instances"
  value       = aws_instance.demo_ec2[*].id
}
