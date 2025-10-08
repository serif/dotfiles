-- lua/config/keymaps.lua

-- Remove default mappings that conflict if needed
-- vim.keymap.del("n", "<C-b>")  -- example if you want to clear defaults

-- Normal mode remaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-b>", "h", opts)          -- move Left
map("n", "n", "gj", opts)             -- move Down
map("n", "e", "gk", opts)             -- move Up
map("n", "a", "l", opts)              -- move Right
map("n", "t", "i", opts)              -- (t)ype
map("n", "T", "I", opts)              -- (T)ype at bol
map("n", "E", "e", opts)              -- end of word
map("n", "i", "a", opts)              -- insert after
map("n", "h", "n", opts)              -- next match
map("n", "H", "N", opts)              -- previous match

map("n", ",m", ":%s/\r//g<CR>", opts) -- Remove ^M line ends from Windows text

map("i", ",n", "<ESC>", opts)         -- insert > normal
map("v", ",n", "<ESC>", opts)         -- visual > normal
