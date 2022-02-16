# language setup in asdf
asdf plugin add direnv
asdf plugin add flutter
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add yarn

# main language and framework
asdf install flutter latest 
asdf global flutter latest

asdf install golang latest 
asdf global golang  latest

# for environment containerization
asdf install direnv latest 
asdf global direnv  latest

# (currently) for vim coc 
asdf install nodejs latest
asdf global nodejs  latest

asdf install yarn latest
asdf global yarn latest