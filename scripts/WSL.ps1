choco install -y wsl2

#--- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
choco install -y wsl-ubuntu-2004 # --params "/InstallRoot:true"
# run the distro once and have it install locally. The default account is "ubuntu:ubuntu".

RefreshEnv
$distro = "ubuntu2004"

& $distro run useradd -m "$username"
if ($LASTEXITCODE -ne 0) { throw }
& $distro run "echo '${username}:${password}' | chpasswd"
& $distro run sh -c "echo '${username}:${password}' | sudo chpasswd" # wrapped in sh -c to get the pipe to work
if ($LASTEXITCODE -ne 0) { throw }
& $distro run chsh -s /bin/bash "$username"
if ($LASTEXITCODE -ne 0) { throw }
& $distro run usermod -aG adm,cdrom,sudo,dip,plugdev "$username"
if ($LASTEXITCODE -ne 0) { throw }

# apt install -y isn't enough to be truly noninteractive
$env:DEBIAN_FRONTEND = "noninteractive"
$env:WSLENV += ":DEBIAN_FRONTEND"

# update software
& $distro run apt update
if ($LASTEXITCODE -ne 0) { throw }
& $distro run apt upgrade -y
if ($LASTEXITCODE -ne 0) { throw }
# set default user to user "ubuntu"
& $distro config --default-user "$username"
if ($LASTEXITCODE -ne 0) { throw }
