# run the distro once and have it install locally. The default account is "ubuntu:ubuntu".

$distro = "ubuntu2004"
$username="ubuntu"
$password="ubuntu"

& $distro run useradd -m "$username"
if ($LASTEXITCODE -ne 0) { throw }
& $distro run "echo '${username}:${password}' | chpasswd"
if ($LASTEXITCODE -ne 0) { throw }
& $distro run chsh -s /bin/bash "$username"
if ($LASTEXITCODE -ne 0) { throw }
& $distro run usermod -aG adm,cdrom,sudo,dip,plugdev "$username"
if ($LASTEXITCODE -ne 0) { throw }

# set default user to user "ubuntu"
& $distro config --default-user "$username"
if ($LASTEXITCODE -ne 0) { throw }