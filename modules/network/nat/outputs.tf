output "nat_id" {
  description = "The ID of the IGW"
  value       = "${aws_nat_gateway.nat.id}"
}
