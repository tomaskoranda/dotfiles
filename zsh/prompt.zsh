################################################################################
# Basic "backup" prompt                                                        #
################################################################################
# First line `# USER at HOST in CWD [on (BRANCH)]`
_PROMPT_SYMBOL="%F{white}#%f"
_USER="%F{yellow}%n%f"
_AT="%F{white}at%f"
_HOST="%F{green}%m%f"
_IN="%F{white}in%f"
_CWD="%F{cyan}%~%f"
# quick fix:
# reuse parse_git_branch() function to render "on" only if there is a git repo
parse_git_branch2() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/on/'
}
_ON="%F{white}\$(parse_git_branch2)%f"

parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
_GIT="%F{magenta}\$(parse_git_branch)%f"

# Second line
NEWLINE=$'\n'
_ERROR_PROMPT="%F{red}!%? >%f"
_OK_PROMPT="%F{green}>%f"
# %(?.<success expression>.<failure expression>)
_STATUS_CMD_PROMPT="%(?.$_OK_PROMPT.$_ERROR_PROMPT) "

################################################################################
# Final prompt
PROMPT="$_PROMPT_SYMBOL $_USER $_AT $_HOST $_IN $_CWD $_ON $_GIT ${NEWLINE}$_STATUS_CMD_PROMPT"
