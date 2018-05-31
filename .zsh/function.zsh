# すべての履歴一覧表示
function history-all { history -E 1 }

# w3mでgoogle検索
function google() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  w3m http://www.google.co.jp/$opt
}

# Ctrl+Oでls
# http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
ls_current_dir() {
    zle accept-line
    if [[ -z "$BUFFER" ]]; then
        echo ''
        ll
    fi
}
zle -N ls_current_dir
bindkey "^O" ls_current_dir

# インクリメンタルサーチ
# ctrl-sでサスペンドするの防止
stty stop undef
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# gitのブランチ名表示
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
# gitリポジトリトップに移動する
function u()
{
    cd ./$(git rev-parse --show-cdup)
    if [ $# = 1 ]; then
        cd $1
    fi
}

# pecoでhistory検索
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function jap() {
  grep -E "^$1" /Users/koike/Downloads/dictionaries/gene-utf8.txt -A 1 -wi --color
}

p() { peco | while read LINE; do $@ $LINE; done }
