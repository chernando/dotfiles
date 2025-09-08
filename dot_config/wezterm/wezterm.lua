-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Initial geometry for new windows:
config.initial_cols = 160

-- TODO: check if this colorscheme is complaint
config.color_scheme = "Solarized - Light"

-- wezterm bundles JetBrains Mono (with Nerd Fonts)
-- JetBrains Mono recommends these options:
config.font_size = 13.0
config.line_height = 1.2

config.default_prog = { '/usr/bin/env', 'fish', '-l' }

-- Finally, return the configuration to wezterm:
return config
