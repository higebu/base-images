#!/bin/bash -x

# Install packages
apt-get install -y ssh openssl

# Create user
useradd -ms /bin/bash core
password=$(openssl passwd -1 password)
sed -i "s%core:!%core:$password%" /etc/shadow
sed -i '$s/$/\ncore ALL=(ALL) NOPASSWD:ALL/' /etc/sudoers

# Clean up
apt-get autoremove -y
apt-get clean
