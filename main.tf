module "common_commands" {
  source = "./modules/commands"

  commands = [
    "echo 'Executing command 1'",
    "echo TF1 > /tmp/tf-mark",
  # "sudo apt-get update",
    "echo 'Executing command 2'",
    "echo TF2 >> /tmp/tf-mark"
  ]
}

locals {
  # Read the file content
  server_file_content = file("${path.module}/servers.tfvars")

  # Split the content into a list of IPs, skipping any empty lines
  servers = [
    for line in split("\n", local.server_file_content) : 
    trimspace(line)
    if length(trimspace(line)) > 0  # Skip empty lines by checking if length > 0
  ]
}

# Output the list of servers for debugging
output "servers" {
  value = local.servers
}

# Loop over the servers and apply common commands
module "server_config" {
  source           = "./modules/remote-exec"
  for_each         = toset(local.servers)  # Convert the list of IPs to a set for iteration
  server_ips       = [each.key]            # Pass the current IP address in a list
  user             = "sles"           # Replace with your SSH username
  private_key_path = "~/.ssh/id_ed25519"
  commands         = module.common_commands.commands
}


