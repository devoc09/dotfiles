local wezterm = require 'wezterm'

local config = {}

if wezterm.confing_builder then
    config = wezterm.confing_builder()
end

config.color_scheme = 'Monokai Soda'
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false})
config.font_size = 12

config.colors = { foreground = '#f8f8f2'}

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
}

return config
