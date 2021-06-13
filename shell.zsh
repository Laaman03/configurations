export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$DOTNET_ROOT
alias vim="nvim"
alias se="cd ~/configurations && nvim shell.zsh"
alias code="/mnt/c/Users/wfarr/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"
alias wttr="wget -qO- wttr.in | head -17"

function configure-up() {
        cd ~/configurations
        git pull
        source ~/.zshrc
        cd -
}

# set up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
