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
