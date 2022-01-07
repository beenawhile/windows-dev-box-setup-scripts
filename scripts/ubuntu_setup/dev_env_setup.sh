# packages
sudo apt-get install -y build-essential curl git wget make unzip  g++ libtool xz-utils  default-jdk net-tools  clang cmake pkg-config libgtk-3-dev
        
# download zsh
sudo apt -y install zsh 
sudo chsh -s $(which zsh)

# download zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"
