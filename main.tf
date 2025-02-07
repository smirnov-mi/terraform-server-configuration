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

module "server_1" {
  source           = "./modules/remote-exec"
  server_ip        = "65.109.64.73"  # Replace with the public IP of server 1
  user             = "sles"  # Replace with the login user
  private_key_path = "~/.ssh/id_ed25519"  # Replace with your SSH private key path
  commands         = module.common_commands.commands
}

#module "server_2" {
#  source           = "./modules/remote-exec"
#  server_ip        = "your_server_2_public_ip"  # Replace with the public IP of server 2
#  user             = "your_user"  # Replace with the login user
#  private_key_path = "~/.ssh/id_rsa"  # Replace with your SSH private key path
#  commands         = module.common_commands.commands
#}
#
#module "server_3" {
#  source           = "./modules/remote-exec"
#  server_ip        = "your_server_3_public_ip"  # Replace with the public IP of server 3
#  user             = "your_user"  # Replace with the login user
#  private_key_path = "~/.ssh/id_rsa"  # Replace with your SSH private key path
#  commands         = module.common_commands.commands
#}

