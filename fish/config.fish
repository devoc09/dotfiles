# disable welcome message
set -g -x fish_greeting


function fish_prompt --description 'define iteractive shell prompt'
    # username & hostname
    set -l short_hostname (hostname | cut -d . -f 1)
    set_color normal
    echo -n (whoami); echo -n '@'; echo -n $short_hostname; echo -n ':'

    # current directory
    set_color blue
    echo -n (prompt_pwd)

    # prompt synbol
    set_color normal
    set -l git_branch (__fish_git_prompt | string trim -c ' ')
    echo -n $git_branch; echo -n '$ '
end

alias ls='ls --color=always'
funcsave ls
