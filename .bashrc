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

### DevOps aliases
# Terraform aliases
alias ter='cd ${PROJECTS}/ops-infrastructure/terraform'
alias t='terraform'
alias ts='terraform state'
alias tsl='terraform state list'
alias tip='clear && terraform init && terraform plan'

# Projects aliases
alias sal='cd ${PROJECTS}/ops-operations/salt'
alias jira='cd ~/Documents/jira'
alias pro='cd ${PROJECTS}/'
alias boto='cd ${PROJECTS}/boto3 && source venv/bin/activate'

# Docker aliases
alias d='sudo docker'
alias dp='sudo docker pull'
alias di='sudo docker images'
alias doc='sudo docker-compose'

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
alias gph="git push"

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

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bash/powerline.sh

# Last commits:
today=$(date +'%Y%m%d')
standup_log="git-standup-logs/standup-${today}.log"
[ ! -f "${PROJECTS}/${standup_log}" ] \
    && cd ${PROJECTS} \
    && unbuffer git-standup -a checco -w "MON-FRI" -m 2 -d 1 | tee ${standup_log} \
    || echo "Check ${PROJECTS}/${standup_log} file for yesterday commits"

