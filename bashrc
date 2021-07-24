
DOCDIR=~/Documents

alias mv='mv -i'
#alias rm='rm -i'
alias rm='echo "Use del or /bin/rm"'
alias cp='cp -i'
alias del='/usr/bin/trash-put'

PATH=$PATH:/home/bin
#CCACHE_DIR=/tmp/ccache

# Set bash to vi mode
set -o vi

export d=$DOCDIR
alias cdd='cd $DOCDIR'

alias l='ls --color=auto -l -h'
alias ls='ls --color=auto'
alias hsk='libreoffice /home/xavier/Documents/perso/HSK/vocabulary.ods &'

alias call='/usr/bin/cal `date +%Y`'

alias trash-size='du -sh ~/.local/share/Trash'

alias e='nvim'
alias evrc='nvim ~/.config/nvim/init.vim'
alias eawrc='nvim ~/.config/awesome/rc.lua'
#alias ms='man -l /home/vault/shortcut.1'
#alias fox='cd ~/pkg/fox/fox'

alias poweroff='sudo /sbin/poweroff'
#alias of='source /home/bin/initializeOpenFOAM'
alias of='source ~/OpenFOAM/OpenFOAM-8/etc/bashrc'
#alias plk='source ~/Projects/plk/etc/bashrc; cd $PLK_PREFIX_DIR'

export TERM="alacritty"
#export LC_CTYPE="en_US.UTF-8"
export EDITOR=nvim

