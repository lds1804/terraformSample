output "public_subnet_id" {
  description = "The ID of the Public Subnet"
  value       = "${aws_subnet.public-subnet.id}"
}
output "public_subnet_cidr_block" {
  description = "The Cidr block of Public Subnet"
  value       = "${aws_subnet.public-subnet.cidr_block}"
}


output "public_subnet_id2" {
  description = "The ID of the Public Subnet"
  value       = "${aws_subnet.public-subnet2.id}"
}