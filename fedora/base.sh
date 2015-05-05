#!/bin/bash -x

# yum update and install packages
yum update -y
yum install -y openssh-server sudo iproute openssl vim

# Generate ssh host keys
ssh-keygen -A

# Create user
useradd -ms /bin/bash core
password=$(openssl passwd -1 password)
sed -i "s%core:!!%core:$password%" /etc/shadow
sed -i '$s/$/\ncore ALL=(ALL) NOPASSWD:ALL/' /etc/sudoers

# Clean up
yum clean all
