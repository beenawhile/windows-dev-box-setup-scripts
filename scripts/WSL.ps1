# wsl setup
choco install -y wsl2

choco install -y wsl-ubuntu-2004 --params "/InstallRoot:true"
# run the distro once and have it install locally.

RefreshEnv
$distro = "ubuntu2004"

# apt install -y isn't enough to be truly noninteractive
$env:DEBIAN_FRONTEND = "noninteractive"
$env:WSLENV += ":DEBIAN_FRONTEND"

# update software
& $distro run apt update
if ($LASTEXITCODE -ne 0) { throw }
& $distro run apt upgrade -y
