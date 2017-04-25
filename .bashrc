# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi='vim'
alias list='sudo netstat -putan | grep LISTEN'

# User env
PROJECTS="/home/flatini/projects"

# DevOps aliases
alias ter='cd ${PROJECTS}/ops-infrastructure/terraform'
alias t='terraform'
alias sal='cd ${PROJECTS}/ops-operations/salt/salt'
alias jira='cd ~/Documents/jira'
alias pro='cd ${PROJECTS}/'
alias boto='cd ${PROJECTS}/boto3 && source venv/bin/activate'

# Docker aliases
alias d='docker'
alias dp='docker pull'
alias di='docker images'
alias doc='docker-compose'

# Git aliases
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit -am"
alias gb="git branch"
alias gd="git diff"
alias gco="git checkout"
alias gpom="git pull origin master"
alias gp="git pull"
alias gs="git status"
alias gmm="git merge master"
alias gmd="git merge develop"

# Vault envs
export VAULT_TOKEN=$(cat ~/.vault-token)
export VAULT_ADDR="https://vault.prod.auto1.team"

# Bash History Hack
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%d/%m/%y %T "

# Append to the history file, don't overwrite it
shopt -s histappend

# SSH Hack
[ -z "$SSH_AUTH_SOCK" ] && eval `ssh-agent` && ssh-add

# Prompt Hack
COLBROWN="\[\033[1;33m\]"
COLRED="\[\033[1;31m\]"
COLGREEN="\[\033[1;32m\]"
COLCLEAR="\[\033[0m\]"

function pwd_depth_limit_2 {
    [ "$PWD" = "$HOME" ] && echo -n "~home~" || pwd | sed -e "s|.*/\(.*/.*\)|\1|"
}

function hour_now {
    date +'%H:%M:%S'
}

function set_virtualenv {
    [ ! -z "$VIRTUAL_ENV" ] && echo " (`basename \"$VIRTUAL_ENV\"`)"
}

export -f  pwd_depth_limit_2
export PS1="$COLRED<$COLGREEN\$(set_virtualenv)$COLBROWN \$(hour_now) $COLRED-$COLBROWN \$(pwd_depth_limit_2) $COLRED>$COLCLEAR "

# Oh My Git
export TERM="xterm-color"
source /home/flatini/.oh-my-git/prompt.sh

# Last commits:
today=$(date +'%Y%m%d')
standup_log="git-standup-logs/standup-${today}.log"
[ ! -f "${PROJECTS}/${standup_log}" ] \
    && cd ${PROJECTS} \
    && unbuffer git-standup -a checco -w "MON-FRI" -m 2 -d 1 | tee ${standup_log} \
    || echo "Check ${standup_log} file for yesterday commits"

# Color Palette
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37

