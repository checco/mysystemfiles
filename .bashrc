# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

# User specific aliases and functions
alias vi='vim'
alias viup='vim +PluginUpdate +qall'
alias list='sudo netstat -putan | grep LISTEN'
alias dup='sudo dnf update'
alias dupy='sudo dnf update -y'
alias din='sudo dnf install'
alias dse='sudo dnf search'
alias dpr='sudo dnf provides'
alias ducks='du -cks * | sort -rn | head'
alias au='atom-upgrade.sh'
alias wt='curl wttr.in'
alias wttr='curl wttr.in'

# User env
PROJECTS="/home/flatini/projects"

# doctl aliases
alias dlist='doctl compute droplet list'
alias dstart='doctl compute droplet-action power-on'

### DevOps aliases
# Terraform aliases
alias ter='cd ${PROJECTS}/ops-infrastructure/terraform'
alias t='terraform'
alias tv='terraform version'
alias ti='terraform init'
alias tiu='terraform init --upgrade=true'
alias tp='terraform plan'
alias tip='terraform init --upgrade=true && terraform plan'
alias tap='terraform apply'
alias tapa='terraform apply -auto-approve'
alias tu='/usr/local/bin/terraform-upgrade.sh'
alias ts='terraform state'
alias tsl='terraform state list'
alias tss='terraform state show'
alias twn='terraform workspace new'
alias twl='terraform workspace list'
alias tws='terraform workspace select'
alias twd='terraform workspace delete'
alias tgrep='egrep -v "\.terraform/|terraform.tfstate"'

# Projects aliases
alias sal='cd ${PROJECTS}/ops-operations/salt'
alias jira='cd ~/Documents/jira'
alias pro='cd ${PROJECTS}/'
alias boto='cd ${PROJECTS}/boto3 && source venv/bin/activate'

# Docker aliases
alias d='sudo docker'
alias dps='sudo docker ps'
alias di='sudo docker images'
alias dr='sudo docker run'
alias ds='sudo docker stop'
alias dk='sudo docker kill'

# Git aliases
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -am'
alias gb='git branch'
alias gcb="git branch | grep --color '*'"
alias gd='git diff'
alias gco='git checkout'
alias gcm='git checkout master && git pull'
alias gpom='git pull origin master'
alias gp='git pull'
alias gpl='git pull'
alias gs='git status'
alias gmm='git merge master'
alias gps='git push'

# Vault aliases
alias v='vault'
alias vv='vault version'
alias vl='vault list'
alias vr='vault read'
alias vw='vault write'
alias vu='/usr/local/bin/vault-upgrade.sh'

# Vault envs
export VAULT_TOKEN=$(cat ~/.vault-token)
export VAULT_ADDR="https://vault.prod.auto1.team"

# PostgreSQL
alias lag='echo "SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag;"'

# Custom
alias standup='/usr/local/bin/standup.sh'
alias sup='/usr/local/bin/standup.sh'
eval $(thefuck --alias)

# Bash History Hack
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%d/%m/%y %T "

# Append to the history file, don't overwrite it
shopt -s histappend

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bash/powerline.sh

# doctl completion
#source <(doctl completion bash)

complete -C /usr/local/bin/terraform terraform
