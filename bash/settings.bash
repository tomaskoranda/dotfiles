# History settings
HISTFILE="$HOME/.bash_history" # Set history file location
HISTSIZE=1048576               # Number of history entries to keep in memory
SAVEHIST=1048576               # Number of history entries to save to disk
shopt -s histappend            # Appended history to HISTFILE on shell exit, instead of overwriting the file
