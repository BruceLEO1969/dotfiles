#Customizing git prompt
ResetColor="\[\033[0m\]"            # Text reset
IntenseBlack="\[\033[0;90m\]" # Grey
Yellow="\[\033[0;33m\]"
IntenseBlack="\[\033[0;90m\]"
BoldGreen="\[\033[1;32m\]"
GIT_PROMPT_START="${BoldGreen}\h ${Yellow}\w${ResetColor}"

[ -f ~/.bash-git-prompt/gitprompt.sh ] && . ~/.bash-git-prompt/gitprompt.sh || echo "Missing git prompt, please run makesetup"
set -o vi
eval "$(rbenv init -)"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
export EDITOR=vim

# Vagrant aliases.
alias vms='VBoxManage list runningvms'
power_down_vms() {
  VMS=$(VBoxManage list runningvms | awk '{ x=$1;gsub("\"", "", x);print x }')
  for i in $VMS 
  do 
    echo "Shutting down $i"
    VBoxManage controlvm $i poweroff 2> /dev/null
  done
}
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#DIR Colors 
export CLICOLOR=1
alias ls='ls -lph --color'
if [[ "SolarizedLight" == $ITERM_PROFILE ]]; then
  eval $(dircolors ~/.dir_colors_light)
else
  eval $(dircolors ~/.dir_colors_dark)
fi
alias t2='tree -Fth -L 2 --du |less'
