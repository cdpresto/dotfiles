# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -alh'
alias df='df -h'
alias du='du -smh'
alias calc='libreoffice --calc'
alias ssh='~/bin/ssh-remote'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias idrive='/opt/IDriveForLinux/bin/idrive'

export HISTFILE=~/.bash_history_all
export HISTSIZE=1000000
export HISTFILESIZE=1000000
# Append to the history file, don't overwrite it
shopt -s histappend
# Ignore duplicate entries and entries starting with a space
export HISTCONTROL=ignoreboth

# Update the history after each command
export PROMPT_COMMAND="history -a; history -c; history -r"
HISTCONTROL=ignorespace:erasedups
HISTTIMEFORMAT="%F %T  "
EDITOR="/bin/vim"

#added to change the colors
export CLICOLOR=TRUE
#export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=1;33:bd=1;33;41:cd=1;33;40:su=1;30:sg=1;32:tw=1;30"
export LS_COLORS="di=1;38;5;15;48;5;27:ln=1;38;5;16;48;5;51:so=1;38;5;15;48;5;201:pi=1;38;5;16;48;5;226:bd=1;38;5;15;48;5;196:cd=1;38;5;16;48;5;208:su=1;38;5;15;48;5;93:sg=1;38;5;16;48;5;46:tw=1;38;5;15;48;5;198"

export PATH=/usr/lib64/ccache:/bin:/home/otc/.local/bin:/usr/share/Modules/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$HOME/bin

# this changes the prompt colors 3* is foreground and 4* is background color for the prompt
# old cursor PS1="\[\e[37m\]\[\e[40m\]\u@\h:\w\$ \[\e[0m\]"
PS1="\[\e[1m\]\u@\h:\w\$ \[\e[0m\]"
