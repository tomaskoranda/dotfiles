# External plugins (initialized before)
# source ~/.config/plugins_before.zsh

# zsh Settings
source ~/.config/zsh/settings.zsh

# Backup prompt
source ~/.config/zsh/prompt.zsh

# External settings (brew, starship, ...)
source ~/.config/shell/external.sh

# Aliases
source ~/.config/shell/aliases.sh

# Load Antigen and apply bundles
source $(brew --prefix)/share/antigen/antigen.zsh
antigen init ~/.config/zsh/.antigenrc

################################################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
