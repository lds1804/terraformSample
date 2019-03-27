output "eip_id" {
  description = "The ID of the eip"
  value       = "${aws_eip.nat_eip.id}"
}
