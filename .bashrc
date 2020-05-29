# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

# User specific aliases and functions
# VIM
alias vi='vim'
alias viup='vim +PluginUpdate +qall'
alias list='sudo netstat -putan | grep LISTEN'

# DNF
alias dup='sudo dnf update'
alias dupy='sudo dnf update -y'
alias din='sudo dnf install'
alias dse='sudo dnf search'
alias dpr='sudo dnf provides'

# Misc
alias ducks='du -cks * | sort -rn | head'
alias au='atom-upgrade.sh'
alias wt='curl wttr.in'
alias wttr='curl wttr.in'

# User env
PROJECTS="${HOME}/projects"
# Projects aliases
alias pro='cd ${PROJECTS}/'
alias boto='cd ${PROJECTS}/boto3 && source venv/bin/activate'

# doctl aliases
alias dlist='doctl compute droplet list'
alias dstart='doctl compute droplet-action power-on'

### DevOps aliases
# Terraform aliases
alias ter='cd ${PROJECTS}/cloud-provisioning'
alias t='terraform'
alias t.apply='terraform apply'
alias t.applyy='terraform apply -auto-approve'
alias t.grep='egrep -v "\.terraform/|terraform.tfstate"'
alias t.import='terraform import'
alias t.init='terraform init'
alias t.initup='terraform init --upgrade=true'
alias t.plan='terraform plan'
alias t.slist='terraform state list'
alias t.sshow='terraform state show'
alias t.state='terraform state'
alias t.upgrade='/usr/local/bin/terraform-upgrade.sh'
alias t.validate='terraform validate'
alias t.version='terraform version'
alias t.wnew='terraform workspace new'
alias t.wlist='terraform workspace list'
alias t.wselect='terraform workspace select'
alias t.wdelete='terraform workspace delete'

# Docker aliases
alias d='sudo docker'
alias d.images='sudo docker images'
alias d.kill='sudo docker kill'
alias d.ps='sudo docker ps'
alias d.run='sudo docker run'
alias d.stop='sudo docker stop'
alias d.version='docker --version'

# Kubernetes aliases
alias k.all='kubectl get all --all-namespaces'
alias k.delete='kubectl delete'
alias k.describe='kubectl describe'
alias k.explain='kubectl explain'
alias k.namespaces='kubectl get namespaces'
alias k.netpolicy='kubectl get NetworkPolicy'
alias k.nodes='kubectl get nodes'
alias k.pods='kubectl get pods'
alias k.port-forward='kubectl port-forward'
alias k.service='kubectl get service'
alias k.services='kubectl get services'
alias k.sts='kubectl get sts'
alias k.top-node='kubectl top node'
alias k.top-pod='kubectl top pod'
alias k.version='kubectl version'

# Git aliases
alias g='git'
alias g.add='git add'
alias g.addcommit='git commit -am'
alias g.branch='git branch'
alias g.branchcolor="git branch | grep --color '*'"
alias g.checkout='git checkout'
alias g.clone='git clone'
alias g.commit='git commit -m'
alias g.diff='git diff'
alias g.master='git checkout master && git pull'
alias g.merge='git merge'
alias g.mergemaster='git merge master'
alias g.pull='git pull'
alias g.pullmaster='git pull origin master'
alias g.push='git push'
alias g.status='git status'
alias g.version='git --version'

# Vault aliases
alias v='vault'
alias v.list='vault list'
alias v.read='vault read'
alias v.upgrade='/usr/local/bin/vault-upgrade.sh'
alias v.version='vault version'
alias v.write='vault write'

# Vault envs
#export VAULT_TOKEN=$(cat ~/.vault-token)
#export VAULT_ADDR=""

# PostgreSQL
alias lag='echo "SELECT extract(epoch from now() - pg_last_xact_replay_timestamp()) AS slave_lag;"'

# MySQL

# Custom
alias standup='/usr/local/bin/standup.sh'
alias sup='/usr/local/bin/standup.sh'
#eval $(thefuck --alias)

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

# completions
source <(doctl completion bash)
complete -C /usr/local/bin/terraform terraform
