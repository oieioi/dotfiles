case ${OSTYPE} in
  darwin*)
    fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
    fpath=($(brew --prefix)/share/zsh-completions $fpath)
    ;;
  linux*)
    fpath=(/usr/local/share/zsh/site-functions $fpath)
    fpath=(/usr/local/share/zsh/zsh-completions $fpath)
    ;;
esac

autoload -U compinit
compinit

autoload bashcompinit
bashcompinit

# ssh config読む
hosts=( ${(@)${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f ~/.ssh/config ]] && < ~/.ssh/config)"}%%\#*}}##host(|name) *}#host(|name) }/\*} )
zstyle ':completion:*:hosts' hosts $hosts

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# git
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
