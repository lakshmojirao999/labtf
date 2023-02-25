
output "mybucket" {
    
    value = module.bucket.s3bucket
  
}


output "appServerId" {
    
    value = module.appServer.instanceId
  
}

output "appServerIP" {
    value = module.appServer.privateIP
}