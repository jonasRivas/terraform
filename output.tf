output "intance_ip" {
  value = aws_instance.web.public_ip
}

output "vpc" {
  value = aws_vpc.main
  description= "this is a description"
  sensitive = true 
}
