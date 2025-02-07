variable "server_ips" {
  description = "List of IPs of the servers"
  type        = list(string)
}

variable "user" {
  description = "The user to log into the servers"
  type        = string
}

variable "private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "commands" {
  description = "List of commands to execute on the remote servers"
  type        = list(string)
}

