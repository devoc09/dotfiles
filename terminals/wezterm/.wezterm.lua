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

-- startup size
config.initial_rows = 80
config.initial_cols = 230

config.color_schemes = {
  ['lflops'] = {
    -- [0]  = "#373b41" /* black   */
    -- [1]  = "#ff5682" /* red     */
    -- [2] = "#7fd06e" /* green   */
    -- [3] = "#ffd982" /* yellow  */
    -- [4] = "#00dbea" /* blue    */
    -- [5] = "#9b8fcb" /* magenta */
    -- [6] = "#f771be" /* cyan    */
    -- [7] = "#d2cdf4" /* white   */
    -- [8] = "#485890" /* black   */
    -- [9] = "#c24163" /* red     */
    -- [10] = "#6eb35f" /* green   */
    -- [11] = "#c3a664" /* yellow  */
    -- [12] = "#00919b" /* blue    */
    -- [13] = "#9372af" /* magenta */
    -- [14] = "#ca5c9c" /* cyan    */
    -- [15] = "#b8b8ba" /* white   */
    -- [256] = "#1d1f21", /* background */
    -- [257] = "#d2cdf4", /* foreground */

    foreground = '#d2cdf4',
    background = '#333333',
    cursor_bg = 'orange',
    cursor_fg = 'orange',
    cursor_border = 'orange',
    selection_fg = 'black',
    selection_bg = '#fffacd',
    scrollbar_thumb = '#222222',
    split = '#444444',
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
