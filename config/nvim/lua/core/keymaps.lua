-- lua/config/keymaps.lua

-- Remove default mappings that conflict if needed
-- vim.keymap.del("n", "<C-b>")  -- example if you want to clear defaults

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Motions
--   normal
map("n", "B", "h", opts)          -- move Left
map("n", "n", "gj", opts)         -- move Down
map("n", "e", "gk", opts)         -- move Up
map("n", "a", "l", opts)          -- move Right
--   visual
map("v", "B", "h", opts)          -- move Left
map("v", "n", "gj", opts)         -- move Down
map("v", "e", "gk", opts)         -- move Up
map("v", "a", "l", opts)          -- move Right
--   raven layout
map("n", "t", "i", opts)          -- (t)ype
map("n", "T", "I", opts)          -- (T)ype at bol
map("n", "E", "e", opts)          -- end of word
map("n", "i", "a", opts)          -- insert after
map("n", "h", "n", opts)          -- next match
map("n", "H", "N", opts)          -- previous match
map("n", "<C-n>", "<C-f>M", opts) -- previous match
map("n", "<C-e>", "<C-b>M", opts) -- previous match

-- Return to normal
map("i", ",n", "<Esc>", opts) -- insert > normal
map("v", ",n", "<Esc>", opts) -- visual > normal

-- Leap
map({ "n", "x", "o" }, "s", "<Plug>(leap)")
map("n", "S", "<Plug>(leap-from-window)")

-- Misc
--   clean ^M (windows \r carriage return)
map("n", ",m", function()
  vim.cmd("silent! :%s/\r//g")
end, opts) -- Remove ^M line ends from Windows text
map("n", "?", ":nohlsearch<CR>")
