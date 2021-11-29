# download essential tools
Ubuntu2004 run apt-get install -y build-essential wget git make curl unzip g++ libtool

# download zsh
Ubuntu2004 run apt install zsh -y
Ubuntu2004 run chsh -s $(which zsh)

# download oh-my-zsh
Ubuntu2004 run sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

