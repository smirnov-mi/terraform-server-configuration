variable "commands" {
  description = "The list of commands to execute on the remote server."
  type        = list(string)
}

output "commands" {
  value = var.commands
}
