# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && source `brew --prefix`/etc/autojump.sh
# nvm
#[[ -s $(brew --prefix nvm)/nvm.sh ]] && source $(brew --prefix nvm)/nvm.sh

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
eval "$(pyenv init -)"
