# packages
sudo apt-get install -y build-essential curl git wget make unzip  g++ libtool xz-utils  default-jdk net-tools  clang cmake pkg-config libgtk-3-dev libssl-dev zlib1g-dev

# download zsh
sudo apt -y install zsh exuberant-ctags neofetch neovim
sudo chsh -s $(which zsh)

# download zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"
