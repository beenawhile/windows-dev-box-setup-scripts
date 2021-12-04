choco install -y wsl2

#--- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
choco install wsl-ubuntu-2004 --params "/InstallRoot:true"
# run the distro once and have it install locally. The default account is "ubuntu:ubuntu".

RefreshEnv
$distro = "ubuntu2004"
$username = "ubuntu"
$password = "ubuntu"

#& $distro install --root
#if ($LASTEXITCODE -ne 0) { throw "Could not install distro." }
# the only non-interactive way to set up a WSL distro is the --root flag
#    https://github.com/microsoft/WSL/issues/3369
# but it has the side effect of making all `wsl` calls run as root,
# so users still need to manually intervene to set up a regular account.
# Workaround this by installing with --root but then replicating,
# noninteractively, what happens in the WSL DistroLauncher:
#   https://github.com/microsoft/WSL-DistroLauncher/blob/2ed9a9335fc89a688a5150c95eff4fbdbc830f25/DistroLauncher/DistributionInfo.cpp#L8-L33
#& $distro run useradd -m "$username"
#if ($LASTEXITCODE -ne 0) { throw }
#& $distro run sh -c 'echo "${username}:${password}" | chpasswd' # wrapped in sh -c to get the pipe to work
#if ($LASTEXITCODE -ne 0) { throw }
# & $distro run chsh -s /bin/bash "$username"
# if ($LASTEXITCODE -ne 0) { throw }
#& $distro run usermod -aG adm,cdrom,sudo,dip,plugdev "$username"
#if ($LASTEXITCODE -ne 0) { throw }


# apt install -y isn't enough to be truly noninteractive
$env:DEBIAN_FRONTEND = "noninteractive"
$env:WSLENV += ":DEBIAN_FRONTEND"

# update software
& $distro run apt-get update
if ($LASTEXITCODE -ne 0) { throw }
& $distro run apt upgrade -y
if ($LASTEXITCODE -ne 0) { throw }
# & $distro run apt-get autoremove -y
# if ($LASTEXITCODE -ne 0) { throw }
# & $distro run apt-get autoclean
# if ($LASTEXITCODE -ne 0) { throw }
wsl --terminate "Ubuntu-20.04"  # instead of 'reboot'
if ($LASTEXITCODE -ne 0) { throw }
#& $distro config --default-user "$username"
#if ($LASTEXITCODE -ne 0) { throw }
