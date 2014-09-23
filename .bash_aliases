# General
alias ls='ls -lpa'

# Git
alias gst="git status"
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'
alias gl='git pull'
alias gm='git merge'
alias gco='git checkout'

# Rails
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias rs='rails s'
alias rc='rails c'
alias rg='rails g'

alias ss='script/server'
alias sc='script/console'
alias sg='script/generate'

###

# DB Access EOP
alias devsql="mysql -u emery -h lucy -p rubyfour"
alias olddevsql="mysql -u emery -h lucy -p sandbox"
alias testsql="mysql -u emery -h lucy -p test"
alias stagesql="mysql -u emery -h lucy -p emery"
