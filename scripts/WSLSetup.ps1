$distro = "ubuntu1804"

# download essential tools
& $distro run apt-get install -y build-essential curl git wget make unzip zip g++ libtool xz-utils libglu1-mesa default-jdk

# download zsh
& $distro run apt -y install zsh 
& $distro run chsh -s $(which zsh)

# download oh-my-zsh
& $distro run sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
# echo "\n\nexport JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.zshrc

# download oh-my-zsh theme (powerlevel10k)
& $distro run git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# download asdf
& $distro run git clone https://github.com/asdf-vm/asdf.git ~/.asdf -y
