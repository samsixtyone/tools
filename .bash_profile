
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias pup1='ssh-add && ssh -A -o StrictHostKeyChecking=no tul1itdpup1.corporate.local'
alias pup2='ssh-add && ssh -A -o StrictHostKeyChecking=no tul1itdpup2.corporate.local'
alias pup3='ssh-add && ssh -A -o StrictHostKeyChecking=no tul1itdpup3.corporate.local'
alias pup4='ssh-add && ssh -A -o StrictHostKeyChecking=no tul1itdpup4.corporate.local'
#alias sssh='ssh-add && ssh -A -i /Users/sahmed/.ssh/dev-shared.pem -l ec2-user '
function sssh() {
  ssh-keygen -R $1  && ssh-add && ssh -A  -o StrictHostKeyChecking=no -i /Users/sahmed/.ssh/dev-shared.pem -l ec2-user $1
}

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export HISTFILESIZE=2500
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\e[0;31m\]\u\[\e[m\]@\[\e[0;36m\]\h\[\e[m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
