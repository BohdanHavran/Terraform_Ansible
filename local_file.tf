# Configuration ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/tpl/hosts.tpl",
    {
      Ubuntu_public_ip = aws_instance.Ubuntu.public_ip
      RedHat_public_ip = aws_instance.RedHat.public_ip
    }
  )
  filename = "ansible/hosts.cfg"
}
