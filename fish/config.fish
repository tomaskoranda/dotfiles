if status is-interactive
    # Commands to run in interactive sessions can go here
end

################################################################################
# run `fish_config` to configure the prompt, color scheme etc.
# To choose defautl prompt/theme run:
# `fish_config prompt list`
# `fish_config prompt choose default && fish_config prompt save` 
# `fish_config theme choose coolbeans && fish_config theme save` 
################################################################################

# Remove default greeting
set fish_greeting ""

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set-up (alias) thefuck error correction
thefuck --alias | source # error when used in combination with fish themes

# Cross-Shell Prompt
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/anaconda3/bin/conda
    eval /opt/homebrew/anaconda3/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<
