# EC2 instance
resource "aws_instance" "App" {
  count                       = 2
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[1]
  vpc_security_group_ids      = [aws_security_group.App_security.id]
  associate_public_ip_address = true
  key_name                    = "id_rsa"
  tags = {
    Name  = "App-${count.index + 1}"
  }
}

resource "aws_instance" "BD" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.BD_security.id]
  key_name               = "id_rsa"
  tags = {
    Name  = "BD"
  }
}

resource "aws_instance" "Bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.Bastion_security.id]
  associate_public_ip_address = true
  key_name                    = "id_rsa"
  tags = {
    Name  = "Bastion"
  }
  depends_on                  = [aws_instance.BD]
}
