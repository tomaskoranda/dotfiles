# source ~/.shell/external.sh in .bashrc and .zshrc
# FIXME: fish?
################################################################################

# 1. Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
# FIXME: Eval only on macOS
# if test ! "$(uname)" = "Darwin"; then
#     eval "$(/opt/homebrew/bin/brew shellenv)"
# else
#     ...
# fi

# 2. Setup Starship (Cross-Shell Prompt)
_CURRENT_SHELL="$(ps -p "$$" | tail -1 | grep -E --only-matching '(zsh|bash|fish)')"

if [ "$_CURRENT_SHELL" "==" "bash" ]; then
    eval "$(starship init bash)"
elif [ "$_CURRENT_SHELL" "==" "zsh" ]; then
    eval "$(starship init zsh)"
# elif [ "$_CURRENT_SHELL" "==" "fish" ]; then
#     starship init fish | source
fi

# 3. Setup thefuck
eval $(thefuck --alias)

# 4. TODO: Run neofetch "only once"
# ...
