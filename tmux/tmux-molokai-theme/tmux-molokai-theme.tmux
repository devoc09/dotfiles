#!/bin/bash
molokai_black="#272822"
molokai_blue="#66d9ef"
molokai_yellow="#f4bf75"
molokai_red="#f92672"
molokai_white="#f9f8f5"
molokai_green="a6e22e"
molokai_visual_grey="#3e4452"
molokai_comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$molokai_white"
set "message-bg" "$molokai_black"

set "message-command-fg" "$molokai_white"
set "message-command-bg" "$molokai_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$molokai_black"
setw "window-status-bg" "$molokai_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$molokai_black"
setw "window-status-activity-fg" "$molokai_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$molokai_comment_grey"
set "window-active-style" "fg=$molokai_white"

set "pane-border-fg" "$molokai_white"
set "pane-border-bg" "$molokai_black"
set "pane-active-border-fg" "$molokai_green"
set "pane-active-border-bg" "$molokai_black"

set "display-panes-active-colour" "$molokai_yellow"
set "display-panes-colour" "$molokai_blue"

set "status-bg" "$molokai_black"
set "status-fg" "$molokai_white"

set "@prefix_highlight_fg" "$molokai_black"
set "@prefix_highlight_bg" "$molokai_green"
set "@prefix_highlight_copy_mode_attr" "fg=$molokai_black,bg=$molokai_green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@onedark_widgets")
time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$molokai_white,bg=$molokai_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$molokai_visual_grey,bg=$molokai_black]#[fg=$molokai_visual_grey,bg=$molokai_visual_grey]#[fg=$molokai_white, bg=$molokai_visual_grey]${status_widgets} #[fg=$molokai_green,bg=$molokai_visual_grey,nobold,nounderscore,noitalics]#[fg=$molokai_black,bg=$molokai_green,bold] #h #[fg=$molokai_yellow, bg=$molokai_green]#[fg=$molokai_red,bg=$molokai_yellow]"
set "status-left" "#[fg=$molokai_black,bg=$molokai_green,bold] #S #{prefix_highlight}#[fg=$molokai_green,bg=$molokai_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$molokai_black,bg=$molokai_black,nobold,nounderscore,noitalics]#[fg=$molokai_white,bg=$molokai_black] #I  #W #[fg=$molokai_black,bg=$molokai_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$molokai_black,bg=$molokai_visual_grey,nobold,nounderscore,noitalics]#[fg=$molokai_white,bg=$molokai_visual_grey,nobold] #I  #W #[fg=$molokai_visual_grey,bg=$molokai_black,nobold,nounderscore,noitalics]"
