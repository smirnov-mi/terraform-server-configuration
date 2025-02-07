# terraform-server-configuration

configure existing server(s) with terraform

## How

main.tf contains the commands to be run on all remote servers, listed in servers.tfvars


## Prereq.

you need running unix server(s), for each of them:

user: sudo-enabled account (must be called "sles" for now)
key: ssh-pub/priv key, from your account to sles@your_server
ip: ip address to reach the server via ssh


## Start

In the root folder prepare (change) the "servers.tfvars" files,
that contains only IP addresses of your server(s), one per line.

```bash
tf init
```

```bash
tf apply
```

