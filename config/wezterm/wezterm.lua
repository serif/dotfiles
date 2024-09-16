-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- Best
config.color_scheme = 'Srcery (Gogh)'
-- config.color_scheme = 'Medallion (Gogh)'
-- config.color_scheme = 'Elemental (Gogh)'
-- config.color_scheme = 'Earthsong (Gogh)'
-- config.color_scheme = 'Atelier Estuary (base16)'
-- Good
-- config.color_scheme = 'JetBrains Darcula'
-- config.color_scheme = 'Jackie Brown (Gogh)'
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
-- config.color_scheme = 'Greenscreen (dark) (terminal.sexy)'
-- config.color_scheme = 'Ic Orange Ppl (Gogh)'
-- config.color_scheme = 'Ibm3270 (Gogh)'
-- config.color_scheme = 'Frontend Fun Forrest (Gogh)'
-- config.color_scheme = 'flexoki-dark'
-- config.color_scheme = 'Espresso Libre (Gogh)'
-- config.color_scheme = 'Elementary (Gogh)'
-- config.color_scheme = 'CrayonPonyFish'
-- config.color_scheme = 'Breeze (Gogh)'
-- config.color_scheme = 'BirdsOfParadise'
-- config.color_scheme = 'Aurthur'

config.font_size = 11
config.line_height = 0.85
config.cell_width = 0.90

-- and finally, return the configuration to wezterm
return config
