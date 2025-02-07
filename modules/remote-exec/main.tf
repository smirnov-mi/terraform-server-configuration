variable "server_ip" {
  description = "The public IP address of the server."
  type        = string
}

variable "user" {
  description = "The SSH login user."
  type        = string
}

variable "private_key_path" {
  description = "The path to the SSH private key."
  type        = string
}

variable "commands" {
  description = "The list of commands to execute on the remote server."
  type        = list(string)
}

resource "null_resource" "remote_commands" {
  provisioner "remote-exec" {
    inline = var.commands

    connection {
      type        = "ssh"
      host        = var.server_ip
      user        = var.user
      private_key = file(var.private_key_path)
    }
  }
}

