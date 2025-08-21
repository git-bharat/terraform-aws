resource "aws_eip" "citadel_eip" {
  vpc = true
  instance = aws_instance.citadel.id
  # Local-exec provisioner to save the public_dns to a file
  provisioner "local-exec" {
    command = "echo ${self.public_dns} > /root/citadel_public_dns.txt"
        }
}
resource "aws_eip_association" "citadel_eip_assoc" {
  instance_id   = aws_instance.citadel.id
  allocation_id = aws_eip.citadel_eip.id
}