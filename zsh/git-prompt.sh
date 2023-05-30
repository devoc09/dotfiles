# SETUP PROMPT
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats "%F{red}%b%f"
precmd () {vcs_info}
PROMPT="%F{cyan}%~%f "

function git_changes() {
    if test "$(git rev-parse --si-inside-work-tree = true 2> /dev/null)"; then
        git_pwd="$(basename -- "$(git rev-parse --show-toplevel)")"/"$(git rev-parse --show-prefix)"
        git_pwd_trim="$(echo ${git_pwd/%?/})"
        if test -z "$(git status --porcelain 2> /dev/null)"; then
            PROMPT='%F{cyan}${git_pwd_trim} ${vcs_info_msg_0_}%f '
        else
            PROMPT='%F{cyan}${git_pwd_trim} ${vcs_info_msg_0_} %F{yellow}X%f '
        fi
    else
        PROMPT="%F{cyan}%~%f "
    fi
}

function add_newline() {
    echo ""
}

function status_code() {
    RPROMPT="%F{white}$(echo $?)"
}
add-zsh-hook precmd git_changes
add-zsh-hook precmd add_newline
add-zsh-hook precmd status_code
