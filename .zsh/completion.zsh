fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fpath=($(brew --prefix)/share/zsh-completions $fpath)

autoload -U compinit
compinit

autoload bashcompinit
bashcompinit

# ssh config読む
hosts=( ${(@)${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f ~/.ssh/config ]] && < ~/.ssh/config)"}%%\#*}}##host(|name) *}#host(|name) }/\*} )
zstyle ':completion:*:hosts' hosts $hosts

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
