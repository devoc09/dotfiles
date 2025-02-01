#------------------------------------------------------
# syntax highlighting
#------------------------------------------------------
set fish_color_error red
set fish_color_normal normal
set fish_color_command normal
set fish_color_quote green
set fish_color_redirection yellow
set fish_color_option normal
set fish_color_status normal
set fish_color_param normal
set fish_color_escape purple
set fish_color_end normal

#------------------------------------------------------
# prompt
#------------------------------------------------------

# disable welcome message
set -g -x fish_greeting

function fish_prompt --description 'define iteractive shell prompt left'
    # Insert new line before prompt
    echo

    # username & hostname
    set -l short_hostname (hostname | cut -d . -f 1)
    echo -n (whoami)"@"$short_hostname":"

    # current directory
    echo -en "\e[34m"(prompt_pwd)"\e[0m"

    # prompt synbol
    set -l git_branch (__fish_git_prompt | string trim -c ' ')
    echo -e "$git_branch\n"'$ '
end

function fish_right_prompt --description 'define interactive shell prompt right'
    # exit code
    set -l last_status $status
    if test $last_status -ne 0
        #set_color red
        echo -ne "\e[31m$last_status\e[0m"
    end
end

function fzf_select_ghq_list --description 'Select a directory from the ghq list'
  ghq list --full-path | fzf --no-sort --reverse --ansi | read selected
  [ -n "$selected" ]; and cd "$selected"
  commandline -f repaint
end

function fish_user_key_bindings
    bind \x1d fzf_select_ghq_list
end

#------------------------------------------------------
# aliases
#------------------------------------------------------
alias vi='nvim'
alias vim='nvim'

#------------------------------------------------------
# custom commands
#------------------------------------------------------

#------------------------------------------------------
# PATH
#------------------------------------------------------
