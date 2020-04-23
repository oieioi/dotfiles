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
ln -s ~/ghq/github.com/oieioi/dotfiles/vim/dein.toml $HOME/.config/nvim/dein.toml

ghq get anyenv/anyenv
mv $(ghq root)/github.com/anyenv/anyenv ~/.anyenv

# Linux Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install fzf

# chromeの操作をemacs風にするやつ
gsettings set org.gnome.desktop.interface gtk-key-theme "Emacs"

# ビルドに必要ないろいろ
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# あとはinit.shを参考に
