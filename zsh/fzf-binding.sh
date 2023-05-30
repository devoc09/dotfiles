function fzf-ghq() {
local dir=$(ghq list -p | fzf)
    if [ -n "$dir" ]; then
        BUFFER="cd ${dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N fzf-ghq
bindkey '^]' fzf-ghq
