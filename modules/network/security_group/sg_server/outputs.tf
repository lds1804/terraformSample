output "server_sg_id" {
  description = "The ID of the server Security Group Id"
  value       = "${aws_security_group.server-sg.id}"
}
