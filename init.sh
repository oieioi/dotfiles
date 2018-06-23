# brew
# https://brew.sh/index_ja
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh Brewfile
sh Brewcaskfile

# dotiles
ln -s /Users/koike/Documents/repos/dotfiles/.gitconfig ~/.gitconfig
ln -s /Users/koike/Documents/repos/dotfiles/.tmux.conf ~/.tmux.conf
ln -s /Users/koike/Documents/repos/dotfiles/.zshrc ~/.zshrc
ln -s /Users/koike/Documents/repos/dotfiles/.zsh ~/.zsh
ln -s /Users/koike/Documents/repos/dotfiles/.vimrc ~/.vimrc
ln -s /Users/koike/Documents/repos/dotfiles/.tigrc ~/.tigrc
mkdir -p ~/.config/nvim
ln -s /Users/koike/Documents/repos/dotfiles/.vimrc ~/.config/nvim/init.vim

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
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true\n
