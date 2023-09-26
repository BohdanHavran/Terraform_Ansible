# resource "aws_subnet" "bd_private" {
#   vpc_id                  = aws_vpc.ansible_vpc.id
#   cidr_block              = "10.0.1.0/24"
#   map_public_ip_on_launch = "false"
#
#   tags = {
#     Name = "bd_private"
#   }
# }
#
# resource "aws_subnet" "app_public" {
#   vpc_id                  = aws_vpc.ansible_vpc.id
#   cidr_block              = "10.0.2.0/24"
#   map_public_ip_on_launch = "true"
#
#   tags = {
#     Name = "app_public"
#   }
# }
