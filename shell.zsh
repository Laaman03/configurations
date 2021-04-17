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
