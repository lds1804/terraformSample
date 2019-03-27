output "instance_id" {
  description = "The ID of the EC2 Server"
  value       = "${aws_instance.server.id}"
}