-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_background_image = '~/aesthetic-wallpapers/images/neon-car2.png'

-- and finally, return the configuration to wezterm
return config
