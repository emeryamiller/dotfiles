echo "Running .bashrc"

[ -f ~/.bash_env ] && source .bash_env;
[ -f ~/.bash_aliases ] && source .bash_aliases;
[ -f ~/.local_bashrc ] && source .local_bashrc;
[ -f ~/.bash_config ] && source .bash_config;
