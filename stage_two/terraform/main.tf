terraform {
  required_version = ">= 1.3.0"
}

resource "null_resource" "vagrant_up" {
  provisioner "local-exec" {
    command = "vagrant up"
  }
}
