

PS1='\[\e[1;36m\]\u\[\e[m\]@\h:\[\e[0;33m\]\w\[\e[m\]\$ '

alias mv='mv -i'
#alias rm='rm -i'
alias rm='echo "Use del or /bin/rm"'
alias cp='cp -i'
alias del='/usr/bin/trash-put'

PATH=$PATH:/home/bin
#CCACHE_DIR=/tmp/ccache

# Set bash to vi mode
set -o vi

#alias l='ls --color=auto -l -h'
#alias ls='ls --color=auto'
alias ls='exa'
alias l='exa -l'
alias la='exa -a'
alias lla='exa -la'

alias pp="pwd | xclip -rmlastnl -selection p;pwd | tr -d '\n';echo \" copied in primary clipboard\""
alias pp1="xclip -rmlastnl -o -selection primary 2> /dev/null"
alias pp2="xclip -rmlastnl -o -selection secondary 2> /dev/null"
alias pp3="xclip -rmlastnl -o -selection clipboard 2> /dev/null"
#alias file='file -S'

# get error messages from journalctl
alias jctl="sudo journalctl -p 3 -xb"

ASTRILL_LIBLSP=/usr/lib/lib/liblsp.so
#alias firefox='echo " *** Load $ASTRILL_LIBLSP for ASTRILL ***";export LD_PRELOAD=$ASTRILL_LIBLSP;/usr/bin/firefox'
#alias thunderbird='echo " *** Load $ASTRILL_LIBLSP for ASTRILL ***";export LD_PRELOAD=$ASTRILL_LIBLSP;/usr/bin/thunderbird'
#alias pacman='echo " *** Load $ASTRILL_LIBLSP for ASTRILL ***";export LD_PRELOAD=$ASTRILL_LIBLSP;/usr/bin/pacman'
#alias call='/usr/bin/cal -y'

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

# For fzf to always searches in HOME directory (fd nust be installed)
export FZF_DEFAULT_COMMAND="fd . $HOME"
