# brew
# https://brew.sh/index_ja
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh Brewfile
sh Brewcaskfile

# dotiles
ln -s $HOME/ghq/github.com/oieioi/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/ghq/github.com/oieioi/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/ghq/github.com/oieioi/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/ghq/github.com/oieioi/dotfiles/.zsh $HOME/.zsh
ln -s $HOME/ghq/github.com/oieioi/dotfiles/.tigrc $HOME/.tigrc
ln -s $HOME/ghq/github.com/oieioi/dotfiles/vim $HOME/.config/nvim

# dein.vim
# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/Downloads/dein-installer.sh
# sh ~/Downloads/dein-installer.sh ~/.cache/dein

# python
pyenv install 3.6.15
pip3 install neovim
pip3 install typing

# gem
gem install neovim

# Finderのタイトル表示
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
