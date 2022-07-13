-- vim.cmd [[
-- try
  -- colorscheme darcula
-- catch /^Vim\%((\a\+)\)\=:E185/
  -- colorscheme default
  -- set background=dark
-- endtry
-- ]]

-- Darcula bg = 2B2B2B, mine = 2A2B2C
-- extra blue for a colorscheme that lacks blue
vim.api.nvim_command([[
  augroup ChangeBackgroudColor
    autocmd colorscheme * :hi normal guibg=#2A2B2C
    autocmd colorscheme * :hi TabLine guifg=#888888
    autocmd colorscheme * :hi TabLineSel guifg=#bbbbbb guibg=#444444
    autocmd colorscheme * :hi LineNr guibg=#313335 guifg=#4B4D4F
  augroup END
]])

require('onedark').setup  {
  -- Main options --
  style = 'warmer', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false,  -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  -- toggle theme style ---
  toggle_style_key = '<leader>ts', -- Default keybinding to toggle
  toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Custom Highlights --
  -- Override default colors
  colors = {
    light_gray = "#707070",     -- comment
    dark_orange = "#CC7832",    -- keyword
    light_orange = "#D49C03",   -- function
    green = "#6A8759",          -- string
    blue = "#6897BB",           -- number
    darker_orange = "#979f4f",  -- string
    light_green = "#7AA975",    -- variable
    tan = "#a19950",            -- builtin
    pea = "#87b04C",            -- method
    red = "#9876AA",            -- JetBrains Purple
    dark_tan = "#808080",       -- type
    ui_main_bg = "#4D5153",
    ui_main_fg = "#C7C7C7",
    ui_dark_fg = "#AAAAAA",
    ui_tabsel_bg = "#616566",
    ui_gutter_bg = "#353739",
    ui_gutter_fg = "#67696D",
  },
  -- Override highlight groups
  highlights = {
    TSComment = {fg = '$light_gray'},
    TSFunction = {fg = '$light_orange'},

    TSKeyword = {fg = '$dark_orange'},
    TSKeywordOperator = {fg = '$dark_orange'},
    TSConditional = {fg = '$dark_orange'},
    TSKeywordFunction = {fg = '$dark_orange'},
    TSRepeat = {fg = '$dark_orange'},
    TSInclude = {fg = '$dark_orange'},

    TSFuncBuiltin = {fg = '$tan'},
    TSMethod = {fg = '$pea'},
    TSString = {fg = '$green'},
    TSNumber = {fg = '$blue'},
    TSVariable = {fg = '$light_green'},
    TSType = {fg = '$dark_tan'},

    TabLineFill = {bg = '$ui_main_bg'}, -- empty tab area
    Tabline = {fg = '$ui_main_fg', bg = '$ui_main_bg'}, -- non-selected tabs
    TablineSel = {fg = '$ui_main_fg', bg = '$ui_tabsel_bg'}, -- selected tabs
    Statusline = {fg = '$ui_gutter_fg', bg = '$ui_gutter_bg'},
    MsgArea = {fg = '$ui_main_fg', bg = '$ui_main_bg'},
    -- TS = {fg = '$'},
  },

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true,   -- use undercurl instead of underline for diagnostics
    background = true,  -- use background color for virtual text
  },
}
require('onedark').load()

-- TODO
-- Enable Lualine onedark
-- require('lualine').setup {
  -- options = {
  -- theme = 'onedark'
  -- ... your lualine config
  -- }
-- }
