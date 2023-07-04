# Standart aliases

# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Remap aliases
alias cat='bat'
alias du='dust --only-dir --si --min-size 500M'
alias grep='rg'