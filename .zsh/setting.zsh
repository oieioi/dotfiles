# 言語
export LANG=ja_JP.UTF-8
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=100000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# brewで入れたbinを優先させる
export PATH=/usr/local/bin:$PATH
# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

export PATH=$PATH:~/bin
# 補完
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fpath=($(brew --prefix)/share/zsh-completions $fpath)


export GOPATH=~/.go

# prompt
PROMPT="%F{cyan}%n%f%F{white}@%f%F{green}%m%f %F{yellow}%~%f %1(v|%F{magenta}%U%1v%f%u|) %F{blue}%*%f
%#"
SPROMPT="correct: %R -> %r ? "

# pushd
setopt auto_pushd
setopt auto_cd
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# 履歴共有
setopt share_history
# かぶった古い履歴を削除
setopt hist_ignore_all_dups
# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ssh config読む
hosts=( ${(@)${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f ~/.ssh/config ]] && < ~/.ssh/config)"}%%\#*}}##host(|name) *}#host(|name) }/\*} )
zstyle ':completion:*:hosts' hosts $hosts
# git branchname show
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
autoload -Uz vcs_info

# 補完
autoload -U compinit
compinit
# bash補完
autoload bashcompinit
bashcompinit

# git + hub = github
#eval "$(hub alias -s)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
