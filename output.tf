# PUBLIC IP FOR SSH CONNECTION
output "pip" {
  value = aws_instance.ec2.public_ip
  description = "PUBLIC IP FOR SSH CONNECTION"
}