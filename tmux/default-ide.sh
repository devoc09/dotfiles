#!/bin/zsh
# set tmux panes and windows default conf
tmux new-window
tmux new-window
tmux rename-session -t 0 main
tmux rename-window -t 1 nora
tmux select-window -t nora

