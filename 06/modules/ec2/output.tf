output "instanceId" {
    value = aws_instance.web.id 
}

output "privateIP" {
    value = aws_instance.web.private_ip
}