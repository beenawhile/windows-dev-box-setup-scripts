
# download essential tools
ubuntu2004 run sudo apt-get install -y build-essential curl git wget make unzip zip g++ libtool xz-utils libglu1-mesa default-jdk

# download zsh
ubuntu2004 run apt -y install zsh 
ubuntu2004 run chsh -s $(which zsh)

# download oh-my-zsh
ubuntu2004 run sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
# echo "\n\nexport JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.zshrc

# download oh-my-zsh theme (powerlevel10k)
ubuntu2004 run git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# download asdf
ubuntu2004 run git clone https://github.com/asdf-vm/asdf.git ~/.asdf -y
