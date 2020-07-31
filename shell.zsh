export PATH="~/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
alias vim="nvim"
alias se="cd ~/configurations && nvim shell.zsh"
alias code="/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin/code"

function configure-up() {
        cd ~/configurations
        git pull
        source ~/.zshrc
        cd -
}
