##### ZSH #####
# should be placed higher than any other source/export(s)
# plugins
plugins=(
git
docker
zsh-autosuggestions
)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH="/Users/sonle/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# maximum scroll history
ulimit -n 8096

##### DEVELOPMENT #####
function tat {
  name=$(basename `pwd` | sed -e 's/\.//g')

  if tmux ls 2>&1 | grep "$name"; then
    tmux attach -t "$name"
  elif [ -f .envrc ]; then
    direnv exec / tmux new-session -s "$name"
  else
    tmux new-session -s "$name"
  fi
}

# aliases
alias k="kubectl"
alias tl="tmux ls"
alias ta="tmux attach"
alias td="tmux detach"
alias tkill="for s in \$(tmux list-sessions | awk '{print \$1}' | rg ':' -r '' | fzy); do tmux kill-session -t \$s; done;"
alias tselect="for s in \$(tmux list-sessions | awk '{print \$1}' | rg ':' -r '' | fzy); do tmux attach-session -t \$s; done;"

# ruby
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# php
export PATH="/usr/local/opt/php@7.3/bin:$PATH"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# flutter
export FLUTTER_PATH=$HOME/flutter
export PATH="$PATH:$FLUTTER_PATH/bin"

# pip
export PYTHON_PATH=$HOME/Library/Python/2.7
export PATH="$PATH:$PYTHON_PATH/bin"