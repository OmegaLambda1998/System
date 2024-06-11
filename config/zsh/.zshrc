#
### ZSH source files 
#

# Options
# Note that zsh_opts loads zsh/complist so *must* come before .zsh_completion which loads compinit
source $ZDOTDIR/.zsh_opts

# Completions 
source $ZDOTDIR/.zsh_completion

# Aliases
source $ZDOTDIR/.zsh_aliases

# User-defined functions
source $ZDOTDIR/.zsh_functions

# Plugins
source $ZDOTDIR/.zsh_plugins

# Interactive startup

# Run fastfetch
if [[ -o interactive ]]; then
    fastfetch
fi
