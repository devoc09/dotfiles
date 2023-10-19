### Zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{160}Installing %F{33}ZINIT%F{160} Initiative Plugin Manager (%F{33}z-shell/zinit%F{160})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone -q https://github.com/z-shell/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# plugins
zinit light zsh-users/zsh-autosuggestions
# zinit light z-shell/fast-syntax-highlighting

# plugins end

# Alias
if [[ -e $HOME/.cargo/bin/coreutils ]]; then
    coreutils=("base32" "base64" "basename" "basenc" "cat" "chcon" "chgrp" "chmod" "chown" "chroot" "cksum" "comm" "cp" "csplit" "cut" "dircolors" "dirname" "du" "echo" "env" "expand" "factor" "false" "fmt" "fold" "groups" "hashsum" "head" "hostid" "hostname" "id" "kill" "link" "ln" "logname" "ls" "mkdir" "mkfifo" "mknod" "mktemp" "mv" "nice" "nl" "nohup" "nproc" "paste" "pathchk" "pinky" "ptx" "pwd" "readlink" "realpath" "relpath" "rm" "rmdir" "runcon" "seq" "shred" "shuf" "sleep" "stat" "stdbuf" "sum" "sync" "tee" "timeout" "touch" "tr" "true" "truncate" "tsort" "tty" "uname" "unexpand" "uniq" "unlink" "uptime" "users" "wc" "who" "whoami" "yes" "date" "tail" "more" "df" "dd" "test")
    for i in $coreutils; do
        alias $i="coreutils ${i}"
    done
fi

## set color for ls command
autoload -Uz colors; colors
autoload -Uz add-zsh-hook
setopt prompt_subst
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias l='ll -F'

bindkey -e

# for curl
setopt nonomatch

# direnv
export EDITOR=nvim

# z command enhanced cd
#eval "$(zoxide init zsh)"

# export TERM=xterm-256color

# golang
# export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:~/go/bin

# rust
# export PATH="$HOME/.cargo/bin:$PATH"

# executes
export PATH=$PATH:"$HOME/bin"

# Setup Prompt
case ${OSTYPE} in
    darwin* )
        PS1='%n@%m%F{white}:%F{green}%~%f$ '
        RPROMPT='%(?..%F{red}%?%f)'
        precmd() {
            echo
        }
        ;;
    linux* )
        PS1='%F{green}%n@%m%F{white}:%F{blue}%~%f$ '
        RPROMPT='%(?..%F{red}%?%f)'
        precmd() {
            echo
        }
        ;;
esac
# PS1='%F{blue}%n@%m%F{white}:%F{green}%~%f$ '
# source "$HOME/dotfiles/zsh/git-prompt.sh"
# source "$HOME/dotfiles/zsh/fzf-binding.sh"

## History share
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zsh_history}"  # The path to the history file.
HISTSIZE=10000                   # The maximum number of events to save in the internal history.
SAVEHIST=10000                   # The maximum number of events to save in the history file.
HISTFILESIZE=10000

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

if [[ -s "${OLD_HISTFILE::=${HISTFILE:h}/.zhistory}" ]]; then

  # New 'HISTFILE' doesn't exist yet, rename legacy one if available and notify.
  if [[ ! -s "$HISTFILE" ]]; then
    <<EON
NOTICE: Default path of 'HISTFILE' has changed from '${OLD_HISTFILE/#$HOME/~}'
        to '${HISTFILE/#$HOME/~}'.
        Attempting to rename the existing 'HISTFILE' ...
EON
    command mv -v "$OLD_HISTFILE" "$HISTFILE"

  # New 'HISTFILE' does exist and is older than legacy one, just warn.
  elif [[ "$OLD_HISTFILE" -nt "$HISTFILE" ]]; then
    <<EOW
WARNING: Default path of 'HISTFILE' has changed from '${OLD_HISTFILE/#$HOME/~}'
         to '${HISTFILE/#$HOME/~}'.
         Either set 'HISTFILE' in '${${0:h}/#$HOME/~}'
         or move previous history from '${OLD_HISTFILE/#$HOME/~}' to
         '${HISTFILE/#$HOME/~}'.
EOW
  fi

  unset OLD_HISTFILE
fi
