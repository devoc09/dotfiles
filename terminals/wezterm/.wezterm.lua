local wezterm = require 'wezterm'

local config = {}

if wezterm.confing_builder then
    config = wezterm.confing_builder()
end

config.color_scheme = 'Monokai Soda'
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false})
config.font_size = 12

config.colors = { foreground = '#f8f8f2'}

return config
