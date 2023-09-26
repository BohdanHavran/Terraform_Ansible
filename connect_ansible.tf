# Connect Ansible
resource "null_resource" "ansible" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH Ubuntu is ready'"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = aws_instance.Bastion.public_ip
    }
  }

  provisioner "local-exec" {
    command = "cd ansible && ansible-playbook playbook.yml"
  }
  depends_on = [local_file.hosts_cfg, local_file.database, aws_lb.web]
}
