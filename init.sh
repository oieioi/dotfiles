#ln -s .emacs ~/.emacs
#ln -s .emacs.d ~/.emacs.d
ln -s /Users/koike/Documents/repos/dotfiles/.gitconfig ~/.gitconfig
ln -s /Users/koike/Documents/repos/dotfiles/.tmux.conf ~/.tmux.conf
ln -s /Users/koike/Documents/repos/dotfiles/.zshrc ~/.zshrc
ln -s /Users/koike/Documents/repos/dotfiles/.zsh ~/.zsh
ln -s /Users/koike/Documents/repos/dotfiles/.vimrc ~/.vimrc
ln -s /Users/koike/Documents/repos/dotfiles/.tigrc ~/.tigrc

mkdir -p ~/.config/nvim
ln -s /Users/koike/Documents/repos/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -s /Users/koike/Documents/repos/dotfiles/.tigrc ~/.tigrc

# neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > neobundle-install.sh
sh neobundle-install.sh

# python
pyenv install 3.6.5
pip3 install neovim
pip3 install typing

# gem
gem install neovim

# Finderのタイトル表示
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true\n
