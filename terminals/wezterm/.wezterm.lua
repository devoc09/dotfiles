local wezterm = require 'wezterm'

local config = {}

if wezterm.confing_builder then
    config = wezterm.confing_builder()
end

config.color_scheme = 'default'
config.font = wezterm.font('Firge35Nerd Console', { weight = 'Bold', italic = false })
config.font_size = 12

config.colors = {
    foreground = '#f8f8f2',
    cursor_bg = 'orange',
    compose_cursor = 'orange',

    ansi = {
        'black','red','green','orange','aqua','purple','cyan','white'

    },
}

config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.5,
}

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
    }
}

return config

