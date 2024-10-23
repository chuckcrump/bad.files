-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'

config.font = wezterm.font ('RecMonoLinear Nerd Font', { weight = 'Bold' })

config.use_fancy_tab_bar = true

config.hide_tab_bar_if_only_one_tab = true

config.use_fancy_tab_bar = true

config.tab_max_width = 35

font_antialias = "Subpixel"

config.font_size=15

return config
