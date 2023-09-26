output "Ubuntu_public_ip" {
  value = aws_instance.Ubuntu.public_ip
}
output "RedHat_public_ip" {
  value = aws_instance.RedHat.public_ip
}
