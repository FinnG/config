
export EDITOR=emacs

if [ -f extra_bash.sh ]; then
    source extra_bash.sh
fi

fortune | cowsay
