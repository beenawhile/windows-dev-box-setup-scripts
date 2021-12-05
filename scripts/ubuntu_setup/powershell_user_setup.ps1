$distro="ubuntu2004"
$username="ubuntu1"
$password="ubuntu1"

& $distro run useradd -m "$username"
if ($LASTEXITCODE -ne 0) { throw }
& $distro run "echo '${username}:${password}' | chpasswd"
& $distro run sh -c "echo '${username}:${password}' | sudo chpasswd" # wrapped in sh -c to get the pipe to work
if ($LASTEXITCODE -ne 0) { throw }
& $distro run chsh -s /bin/bash "$username"
if ($LASTEXITCODE -ne 0) { throw }
& $distro run usermod -aG adm,cdrom,sudo,dip,plugdev "$username"
if ($LASTEXITCODE -ne 0) { throw }
& $distro config --default-user "$username"
if ($LASTEXITCODE -ne 0) { throw }
