resource "null_resource" "eip" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.citadel.public_dns} > /root/citadel_public_dns.txt"
  }
}

output "citadel_public_dns" {
  value = aws_instance.citadel.public_dns
}