output "vm_ip" {
  value = var.vm_ip
}

output "vm_name" {
  value = "yolo-devops-node"
}

output "app_endpoints" {
  value = {
    frontend = "http://${var.vm_ip}:3000"
    backend  = "http://${var.vm_ip}:5000"
  }
}
