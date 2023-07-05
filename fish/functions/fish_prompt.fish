################################################################################
# Basic "backup" prompt                                                        #
################################################################################
function fish_prompt --description 'Write out the prompt'
    # Save the status
    set -l last_status $status

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # First line
    set -l _PROMPT_SYMBOL   (set_color "white")"#"
    set -l _USER            (set_color "yellow")"$USER"
    set -l _AT              (set_color "white")"at"
    set -l _HOST            (set_color "green")(prompt_hostname)
    set -l _IN              (set_color "white")"in"
    set -l _CWD             (set_color "cyan")(prompt_pwd)
    set -l _ON             (set_color "white")""
    if test (string length (fish_vcs_prompt || echo "")) -gt 0
        set _ON             (set_color "white")" on"
    end
    set -l _GIT             (set_color "magenta")(fish_vcs_prompt) 

    # Second line
    if test $last_status -ne 0
        set prompt_status (set_color "red") "!$last_status"
        set suffix (set_color "red")'❯'(set_color "white")
    else
        set prompt_status ""
        set suffix (set_color "green")'❯'(set_color "white")
    end
    
    # Final Prompt
    echo "$_PROMPT_SYMBOL $_USER $_AT $_HOST $_IN $_CWD$_ON$_GIT"
    echo -n -s "$prompt_status $suffix "
end