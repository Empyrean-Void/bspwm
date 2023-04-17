-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Colors
config.colors = {
    -- Main background foreground
    background = '#190c0e',
    foreground = '#eeedf0',

    -- Cursor colors
    cursor_bg = '#eeedf0',
    cursor_fg = '#190c0e',

    -- Normal colors
    ansi = {
        '#190c0e',
        '#e02f1b',
        '#8abd68',
        '#deab5f',
        '#617cce',
        '#85678f',
        '#5e8d87',
        '#eeedf0',
    },

    brights = {
        '#8f98a5',
        '#e02f1b',
        '#8abd68',
        '#f0c674',
        '#81a2be',
        '#b294bb',
        '#8abeb7',
        '#ffffff',
    }
}

-- Hide tab bar
config.enable_tab_bar = false

-- Font
config.font = wezterm.font 'Iosevka Nerd Font'
config.font_size = 12

-- and finally, return the configuration to wezterm
return config
