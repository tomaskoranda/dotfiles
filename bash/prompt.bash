# ################################################################################
# # Basic "backup" prompt                                                        #
# ################################################################################
PROMPT_COMMAND=__prompt_command # Function to generate PS1 after CMDs

__prompt_command() {
    # This needs to be first, store exit code
    local EXIT="$?"

    # Color definitions
    local ATTRIBUTE_BOLD='\[\e[1m\]'
    local ATTRIBUTE_RESET='\[\e[0m\]'
    local COLOR_DEFAULT='\[\e[39m\]'
    local COLOR_RED='\[\e[31m\]'
    local COLOR_GREEN='\[\e[32m\]'
    local COLOR_YELLOW='\[\e[33m\]'
    local COLOR_BLUE='\[\e[34m\]'
    local COLOR_MAGENTA='\[\e[35m\]'
    local COLOR_CYAN='\[\e[36m\]'
    local COLOR_GRAY='\e[38;5;246m'

    parse_git_branch() {
        git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    # quick fix: reuse parse_git_branch() function to render "on" only if there is a git repo
    parse_git_branch2() {
        git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/on/'
    }

    # First line `# USER at HOST in CWD [on (BRANCH)]`
    local _PROMPT_SYMBOL="${COLOR_DEFAULT}#${COLOR_DEFAULT}"
    local _USER="${COLOR_YELLOW}\\u${COLOR_DEFAULT}"
    local _AT="${COLOR_DEFAULT}at${COLOR_DEFAULT}"
    local _HOST="${COLOR_GREEN}\\h${COLOR_DEFAULT}"
    local _IN="${COLOR_DEFAULT}in${COLOR_DEFAULT}"
    local _CWD="${COLOR_CYAN}\w${COLOR_DEFAULT}"
    local _ON="${COLOR_DEFAULT}\$(parse_git_branch2)${COLOR_DEFAULT}"
    local _GIT="${COLOR_MAGENTA}\$(parse_git_branch)${COLOR_DEFAULT}"

    # Second line
    local _ERROR_PROMPT="${COLOR_RED}!$EXIT \$${COLOR_DEFAULT}"
    local _OK_PROMPT="${COLOR_GREEN}\$${COLOR_DEFAULT}"
    local _STATUS_CMD_PROMPT="\$([ $EXIT == 0 ] && echo $_OK_PROMPT || echo $_ERROR_PROMPT ) "

    # Final prompt
    PS1="$_PROMPT_SYMBOL $_USER $_AT $_HOST $_IN $_CWD $_ON $_GIT\n$_STATUS_CMD_PROMPT"
}
