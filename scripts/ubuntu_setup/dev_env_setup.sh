# packages
sudo apt-get install -y build-essential curl git wget make unzip  g++ libtool xz-utils  default-jdk net-tools  clang cmake pkg-config libgtk-3-dev
        
# download zsh
sudo apt -y install zsh 
sudo chsh -s $(which zsh)

# download oh-my-zsh
sh "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# echo "\n\nexport JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.zshrc

# download oh-my-zsh theme (powerlevel10k)
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# zsh library
zinit load zdharma-continuum/history-search-multi-word
zinit load zdharma-continuum/fast-syntax-highlighting
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-completions

# download asdf
zinit load asdf-vm/asdf
