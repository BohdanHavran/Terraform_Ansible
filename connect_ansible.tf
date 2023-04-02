# Connect Ansible
resource "null_resource" "ansible" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH Ubuntu is ready'"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = aws_instance.Ubuntu.public_ip
    }
  }
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH RedHat is ready'"]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = aws_instance.RedHat.public_ip
    }
  }
  provisioner "local-exec" {
    command = "cd ansible && ansible-playbook playbook.yml"
  }
}
