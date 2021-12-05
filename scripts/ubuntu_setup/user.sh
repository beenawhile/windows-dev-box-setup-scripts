username="ubuntu"
userpassword="ubuntu"

useradd -m ${username}
echo ${username}:${userpassword} | chpasswd
chsh -s /bin/bash ${username}
usermod -aG adm,cdrom,sudo,dip,plugdev ${username}

echo "user ${username} is set"