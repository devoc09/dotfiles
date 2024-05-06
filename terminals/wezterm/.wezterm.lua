local wezterm = require 'wezterm'

local config = {}

if wezterm.confing_builder then
    config = wezterm.confing_builder()
end

config.color_scheme = 'default'
-- `SF Mono` is apple font
-- config.font = wezterm.font('SF Mono', { weight = 'Bold', italic = false })
config.font = wezterm.font('Firge35Nerd Console', { italic = false })
config.font_size = 11

config.color_schemes = {
  ['lflops'] = {
    -- /* 8 normal colors */
    -- [0] = "#282a2e" /* black   */
    -- [1] = "#c24163" /* red     */
    -- [2] = "#6eb35f" /* green   */
    -- [3] = "#c3a664" /* yellow  */
    -- [4] = "#00919b" /* blue    */
    -- [5] = "#9372af" /* magenta */
    -- [6] = "#ca5c9c" /* cyan    */
    -- [7] = "#485890" /* white   */
    --
    -- /* 8 bright colors */
    -- [8]  = "#373b41" /* black   */
    -- [9]  = "#ff5682" /* red     */
    -- [10] = "#7fd06e" /* green   */
    -- [11] = "#ffd982" /* yellow  */
    -- [12] = "#00dbea" /* blue    */
    -- [13] = "#9b8fcb" /* magenta */
    -- [14] = "#f771be" /* cyan    */
    -- [15] = "#b8b8ba" /* white   */
    --
    -- /* special colors */
    -- [256] = "#1d1f21", /* background */
    -- [257] = "#d2cdf4", /* foreground */
    
    foreground = '#d2cdf4',
    -- The default background color
    background = '#1d1f21',

    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = 'orange',
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = 'orange',
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = 'orange',

    -- the foreground color of selected text
    selection_fg = 'black',
    -- the background color of selected text
    selection_bg = '#fffacd',

    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = '#222222',

    -- The color of the split lines between panes
    split = '#444444',

    ansi = {
      '#282a2e',
      '#c24163',
      '#6eb35f',
      '#c3a664',
      '#00919b',
      '#9372af',
      '#ca5c9c',
      '#485890',
    },
    brights = {
      '#373b41',
      '#ff5682',
      '#7fd06e',
      '#ffd982',
      '#00dbea',
      '#9b8fcb',
      '#f771be',
      '#b8b8ba',
    },

    -- Arbitrary colors of the palette in the range from 16 to 255
    indexed = { [136] = '#af8700' },

    -- Since: 20220319-142410-0fcdea07
    -- When the IME, a dead key or a leader key are being processed and are effectively
    -- holding input pending the result of input composition, change the cursor
    -- to this color to give a visual cue about the compose state.
    compose_cursor = 'orange',

    -- Colors for copy_mode and quick_select
    -- available since: 20220807-113146-c2fee766
    -- In copy_mode, the color of the active text is:
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    copy_mode_active_highlight_bg = { Color = '#000000' },
    -- use `AnsiColor` to specify one of the ansi color palette values
    -- (index 0-15) using one of the names "Black", "Maroon", "Green",
    --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
    -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

    quick_select_label_bg = { Color = 'peru' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { AnsiColor = 'Navy' },
    quick_select_match_fg = { Color = '#ffffff' },
  },
}

config.colors = {
    cursor_bg = 'orange',
    cursor_border = 'orange',
    compose_cursor = 'orange',
}

config.color_scheme = "tender (base16)"

config.hide_tab_bar_if_only_one_tab = true

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

return config
