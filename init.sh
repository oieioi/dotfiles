# brew
# https://brew.sh/index_ja
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh Brewfile
sh Brewcaskfile

# dotiles
ln -s $HOME/Documents/repos/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/Documents/repos/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/Documents/repos/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/Documents/repos/dotfiles/.zsh $HOME/.zsh
ln -s $HOME/Documents/repos/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/Documents/repos/dotfiles/.tigrc $HOME/.tigrc
mkdir -p $HOME/.config/nvim
ln -s $HOME/Documents/repos/dotfiles/.vimrc $HOME/.config/nvim/init.vim

# dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/Downloads/dein-installer.sh
sh ~/Downloads/dein-installer.sh ~/.cache/dein

# python
pyenv install 3.6.5
pip3 install neovim
pip3 install typing

# gem
gem install neovim

# Finderのタイトル表示
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
