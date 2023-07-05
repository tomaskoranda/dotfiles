# History settings
HISTFILE="$HOME/.zsh_history" # Set history file location
HISTSIZE=1048576              # Number of history entries to keep in memory
SAVEHIST=1048576              # Number of history entries to save to disk

setopt appendhistory          # Append history instead of overwriting
setopt extendedhistory        # Save timestamp of command
setopt incappendhistory       # Immediately append to history instead of waiting until shell exit

# Other settings
unsetopt auto_cd              # Auto change directory when command is directory
unsetopt beep                 # WHY DOES THIS EXIST?
bindkey -e                    # Use emacs style line editing in zsh

# zsh-AutoComplete settings
# zstyle -e ':autocomplete:list-choices:*' list-lines 'reply=( $(( LINES / 3 )) )'
# zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8
# zstyle ':autocomplete:history-search-backward:*' list-lines 256

# Make Tab go straight to the menu and cycle there
# bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
