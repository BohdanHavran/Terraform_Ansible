output "Bastion_public_ip" {
  description = "Public IP of Bastion instances"
  value       = aws_instance.Bastion.public_ip
}

output "BD_private_ip" {
  description = "Privat IP of BD instances"
  value       = aws_instance.BD.private_ip
}

output "App_public_ip" {
  description = "Public IP of App instances"
  value       = ["${aws_instance.App.*.public_ip}"]
}

output "web_loadbalancer_url" {
  description = "Load Balancer"
  value       = aws_lb.web.dns_name
}
