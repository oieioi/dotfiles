sudo apt install git
sudo apt install curl
sudo apt install neovim
sudo snap install --classic tmux
sudo snap install --classic go
# GOPATHの設定とか
go install github.com/x-motemen/ghq
ghq get oieioi/dotfiles
cd ~/ghq/github.com/oieioi/dotfiles

# リンク
ln -s ~/ghq/github.com/oieioi/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s ~/ghq/github.com/oieioi/dotfiles/.zshrc $HOME/.zshrc
ln -s ~/ghq/github.com/oieioi/dotfiles/.zsh $HOME/.zsh
ln -s ~/ghq/github.com/oieioi/dotfiles/.tigrc $HOME/.tigrc
mkdir -p $HOME/.config/nvim
ln -s ~/ghq/github.com/oieioi/dotfiles/.vimrc $HOME/.config/nvim/init.vim

ghq get anyenv/anyenv
mv $(ghq root)/github.com/anyenv/anyenv ~/.anyenv

# Linux Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install fzf
