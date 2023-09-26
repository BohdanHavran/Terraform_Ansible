---
ansible_user : ubuntu
ansible_ssh_private_key_file : ~/.ssh/id_rsa
ansible_ssh_common_args: '-o ProxyCommand="ssh -p 22 -W %h:%p -q ubuntu@${bastion_public_ip}"'

