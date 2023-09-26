# EC2 instance
resource "aws_instance" "Ubuntu" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Ansible_security.id]
  key_name               = "id_rsa"
}
resource "aws_instance" "RedHat" {
  ami                    = data.aws_ami.rhel.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Ansible_security.id]
  key_name               = "id_rsa"
}
