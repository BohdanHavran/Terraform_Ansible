[proxy]
bastion ansible_host=${bastion_public_ip}

[database]
database ansible_host=${database_private_ip}

[app]  
app1 ansible_host=${app1_private_ip}
app2 ansible_host=${app2_private_ip}
