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

#
### Load *all* user-defined functions
#

() {
    # Path to dir containing all functions
    local functions_dir=$ZDOTDIR/plugins/functions

    # FPATH is already tied to fpath, but this adds
    # a uniqueness constraint to prevent duplicate entries
    typeset -TUg +x FPATH=$plugins:$FPATH fpath

    # Autoload all functions
    if [[ -d $functions_dir ]]; then
        for file in $functions_dir/*; do
            autoload -Uz $file
        done
    else
        echo "$functions_dir not found!"
    fi
}

#
### Trigger user-defined functions
#

# Change cursor depending on vim mode
cursor_mode 

#
### Other software initialisation 
#

# Enable conda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Enable zoxide
# zoxide will echo the directory it went to
export _ZO_ECHO=1
# zoxide will follow symlinks before updating history
export _ZO_RESOLVE_SYMLINKS=1
eval "$(zoxide init zsh --cmd cd)"

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Automatic suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# History substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Starship prompt
eval "$(starship init zsh)"
