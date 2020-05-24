case ${OSTYPE} in
  darwin*)
    [[ -s `brew --prefix`/etc/autojump.sh ]] && source `brew --prefix`/etc/autojump.sh
    ;;
  linux*)
    source /usr/share/autojump/autojump.sh
    ;;
esac

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
eval "$(pyenv init -)"
