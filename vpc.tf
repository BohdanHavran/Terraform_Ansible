# # VPC
# resource "aws_vpc" "ansible_vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "Ansible_vpc"
#   }
# }
#
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.ansible_vpc.id
# }
#
# resource "aws_route_table" "rt" {
#   vpc_id = aws_vpc.ansible_vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }
#
# resource "aws_route_table_association" "rta" {
#   subnet_id      = aws_subnet.app_public.id
#   route_table_id = aws_route_table.rt.id
# }
#
# resource "aws_route_table" "prod-private-crt" {
#   vpc_id = aws_vpc.ansible_vpc.id
#
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.prod-nat-gateway.id
#   }
#
#   tags = {
#     Name = "prod-private-crt"
#   }
# }
# resource "aws_route_table_association" "prod-crta-private-subnet-1" {
#   subnet_id      = aws_subnet.bd_private.id
#   route_table_id = aws_route_table.prod-private-crt.id
# }
#
# resource "aws_eip" "nat_gateway" {
#   vpc = true
# }
# resource "aws_nat_gateway" "prod-nat-gateway" {
#   allocation_id = aws_eip.nat_gateway.id
#   subnet_id     = aws_subnet.bd_private.id
#
#   tags = {
#     Name = "VPC Demo - NAT"
#   }
#
#   depends_on = [aws_internet_gateway.igw]
# }
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true

}
