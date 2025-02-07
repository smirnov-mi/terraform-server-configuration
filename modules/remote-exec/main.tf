resource "null_resource" "remote_commands" {
  count = length(var.server_ips)

  connection {
    type        = "ssh"
    host        = var.server_ips[count.index]
    user        = var.user
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = var.commands
  }
}

