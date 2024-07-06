function fzf-ghq() {
local dir=$(ghq list -p | fzf --no-sort --reverse --ansi)
    if [ -n "$dir" ]; then
        BUFFER="cd ${dir}"
        zle accept-line
    fi
    zle clear-screen
}

function fzf-history() {
    BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
    CURSOR=${#BUFFER}
    zle accept-line
}

zle -N fzf-ghq
zle -N fzf-history
bindkey '^]' fzf-ghq
bindkey '^r' fzf-history
