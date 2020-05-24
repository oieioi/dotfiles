alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ..'
# G:色つける
case ${OSTYPE} in
  darwin*)
    alias ls='ls -G'
    ;;
  linux*)
    alias ls='ls --color=auto'
    ;;
esac

# l: リスト表示, A: ..を除いた全ファイル表示, h: バイト数を人間が見やすく表示
alias ll='ls -lAh'
alias python_http_server='python -m SimpleHTTPServer'
alias ducks='du -chs'
alias topcpueater='ps -eo pcpu,pid,user,args | sort -rk1 | head'
alias ifview='/sbin/ifconfig | grep -B 1 inet'
alias g='git'
alias gs='git s'
alias gf='git f -p'
alias gd='git d'
alias ga='git a'
alias gh='cd $(ghq list|fzf|xargs -Irepo echo "$(ghq root)/repo")'
alias grep='grep --color'
alias e='emacsclient -t'
alias es='emacs --daemon'
alias tiga='tig --all'
alias t='tmux -2'
#alias sed=/usr/local/opt/gnu-sed/libexec/gnubin/sed
alias vim=nvim
alias v=vim
alias o='git ls-files | fzf | xargs --no-run-if-empty -o nvim'
alias stree='open -a SourceTree .'
alias tw='docker run --rm -v $HOME/.earthquake:/root/.earthquake -it earthquake --no-stream --no-logo'
alias caim='BUNDLE_GEMFILE=`ghq root`/github.com/oieioi/caim/Gemfile bundle exec ruby `ghq root`/github.com/oieioi/caim/bin/caim'
case ${OSTYPE} in
  darwin*)
    alias ctags="`brew --prefix`/bin/ctags"
    ;;
esac
alias help=tldr
alias spo=spotify
