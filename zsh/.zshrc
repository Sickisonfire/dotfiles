#powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# make it stop 
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='🌑'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/bin/nvim-linux64/bin"
export PATH="$PATH:$HOME/.fly/bin"

#Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

#Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi


#FZF integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

#GO PATH
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yarn
export PATH="$(yarn global bin):$PATH"

# cd into workspace
alias ws="cd ~/Workspace" 
alias ..="cd .."
alias ...="cd ../.."

# use bat instead of cat 
alias cat="bat"

alias v="nvim"
alias g="nvim -c G"

alias icat="kitty +kitten icat --place 50x50@0x150"

# paste to paste.rs
function paste() {
              local file=${1:-/dev/stdin}
              curl --data-binary @${file} https://paste.rs
          }

alias pasters=paste




