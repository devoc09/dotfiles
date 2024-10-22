local wezterm = require 'wezterm'

local config = {}

if wezterm.confing_builder then
    config = wezterm.confing_builder()
end

config.font = wezterm.font('UDEV Gothic NFLG', { italic = false })
config.font_size = 14

-- startup size
config.initial_rows = 50
config.initial_cols = 170

config.cursor_blink_rate = 0

config.color_schemes = {
  ['lflops'] = {
    foreground = '#d2cdf4',
    background = '#0c172a',
    cursor_fg = '#0c172a',
    cursor_bg = '#d2cdf4',
    ansi = {
      '#333333',
      '#ff5682',
      '#7fd06e',
      '#f771be',
      '#00dbea',
      '#9b8fcb',
      '#ffd982',
      '#d2cdf4',
    },
    brights = {
      '#485890',
      '#c24163',
      '#6eb35f',
      '#ca5c9c',
      '#00919b',
      '#9372af',
      '#c3a664',
      '#b8b8ba',
    },
  },
}

config.window_frame = {
  inactive_titlebar_bg = 'none',
  active_titlebar_bg = 'none',
}

config.window_background_gradient = {
  colors = { '#0c172a' },
}

config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

config.colors = {
  tab_bar = {
    inactive_tab_edge = 'none',
  },
}

 wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
   local background = "#242b3a"
   local foreground = "#d2cdf4"

   if tab.is_active then
     background = "#485890"
     foreground = "#d2cdf4"
   end

   local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

   return {
     { Background = { Color = background } },
     { Foreground = { Color = foreground } },
     { Text = title },
   }
 end)

config.color_scheme = "lflops"

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'

config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.5,
}

-- scrollbar
config.enable_scroll_bar = true
config.scrollback_lines = 10000

-- keymaps
act = wezterm.action
config.keys = {
    {
        key = 'd',
        mods = 'CMD',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '[',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Next',
    },
    {
        key = ']',
        mods = 'CMD',
        action = act.ActivatePaneDirection 'Prev',
    },
    {
        key = 'j',
        mods = 'CMD',
        action = act.QuickSelect,
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
}

-- SSH Domains
local ssh_domains = {}
for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
    table.insert(ssh_domains, {
        name = host,
        remote_address = config["hostname"],
        username = config["user"],
        ssh_option = { identityfile = config["identityfile"] },
    })
end
config.ssh_domains = ssh_domains

-- Japanese input
config.use_ime = true

return config
