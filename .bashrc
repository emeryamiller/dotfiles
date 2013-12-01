echo "Running .bashrc"
export LC_ALL=en_CA.UTF-8

alias devsql="mysql -u emery -h lucy -p sandbox"
alias testsql="mysql -u emery -h lucy -p test"
alias ls="ls -lpa"

alias gst="git status"
alias ga="git add"
alias gm="git merge"
alias gco="git checkout"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gb="git branch"
alias gc="git commit"

tmux attach -t dev
