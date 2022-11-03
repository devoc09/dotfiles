#!/bin/zsh

# set tmux panes for ide

tmux split-window -h
tmux split-pane -v
tmux resize-pane -D 15
tmux resize-pane -R 72
