#
# ~/.bashrc
#

# If not running interactively, don't do anything

neofetch

[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Nikhil added new alias
alias cls='clear && neofetch'

# Nikhil initialize pyenv on startup
# export PYENV_DEBUG=true               --commented as pyenv not working
# export PATH="$HOME/.pyenv/bin:$PATH"  --commented as pyenv not working
# eval "$(pyenv init -)"                --commented as pyenv not working
# eval "$(pyenv virtualenv-init -)"     --commented as pyenv not working

# PS1='[\u@\h \W]\$ \n'

export PATH=$PATH:/home/nikhil/.local/bin
############################################################################
# Nikhil attempt to make it look like kali linux                           #
# codes copied from https://github.com/pyenv/pyenv-virtualenv/issues/135    #
############################################################################

# disabling default prompt of pyenv might get deprecated later
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1                                                                                                                                                                         

export VIRTUAL_ENV_DISABLE_PROMPT=1

# defining color escapes for PS1
green='\[\e[0;32m\]'
blue='\[\e[0;34m\]'
reset='\[\e[0m\]'

# base format of promt w/o color and envname
base_ps1=' ┌───(\u@\h)-[\W]\n └─$  '

# adding color to base format
formatted_ps1="${blue}${base_ps1}${reset}" 

PS1=$formatted_ps1

export BASE_PROMPT=$PS1                                                                                                                                               
function updatePrompt {                                                                                                                                                                                           
      if [[ -n $VIRTUAL_ENV ]]; then                                                                                                                              
        
# Nikhil added bcoz oyenv is not workinh so make do with virtualenv and it uses this variable as path
        export PS1="\n${green}[${VIRTUAL_ENV##*/}]${reset} \n"$BASE_PROMPT                                                                                                                                                         
      else                                                                                                                                                                                                          
          export PS1                                                                                                                                                                                   
      fi                                                                                                                                                                                                            
  }                                                                                                                                                                                                                 
export -f updatePrompt
export PROMPT_COMMAND='updatePrompt' 




