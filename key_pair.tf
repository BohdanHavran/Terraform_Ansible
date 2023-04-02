# EC2 Creating key pair
resource "aws_key_pair" "generated_key" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}
