*add this to bashrc*

# env 
export EDITOR=vim
export LANG=en_US.UTF-8

# Prompt
PS1=' \[\e[0;92m\]\w \[\e[0;96m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0;92m\]> \[\e[0m\]' 

source ~/.bash_aliases

# Deactivate ctrl-s (incremental search instead of suspend)
if [[ -t 0 && $- = *i* ]]
then
	stty -ixon
fi 

export XDG_CONFIG_HOME=~/.config
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

