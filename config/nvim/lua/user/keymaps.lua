
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File explorer
map("n", "<leader>o", ":Lexplore<CR>")

-- Enter commands without pressing shift
map("n", ";", ":")
map("n", ":", ";")

-- Quickly return to normal_mode
map("i", ",n", "<Esc>")

-- Colemak_dhm: mnei(hjkl) t(i) <C-n>(f) <C-e>(e)
map("n", "m", "h")          -- move Left
map("n", "n", "gj")         -- move Down (g to allow move within wrapped lines)
map("n", "e", "gk")         -- move Up (g to allow move within wrapped lines)
map("n", "i", "l")          -- move Right
map("n", "t", "i")          -- (t)ype           replaces (i)nsert
map("n", "T", "I")          -- (T)ype at bol    replaces (I)nsert
map("n", "E", "e")          -- end of word      replaces (e)nd
map("n", "h", "n")          -- next match       replaces (n)ext
map("n", "k", "N")          -- previous match   replaces (N) prev
map("n", "<C-m>", "m")      -- mark             replaces (m)ark

-- Ctrl+up/down to page up/down
map("n", "<C-n>", "<C-f>")  -- page down
map("n", "<C-e>", "<C-b>")  -- page up, cursor up

-- Ctrl+left/right to switch between splits TODO not working
-- map("n", "<C-m>", "<C-w>h")  -- move to left split
-- map("n", "<C-i>", "<C-w>l")  -- move to right split

-- Move text up/down TODO not working
-- map("v", "<A-n>", ":m .+1<CR>==")
-- map("v", "<A-e>", ":m .-2<CR>==")


-- PLUGINS

-- EasyMotion - easymotion commands; <leader><motion><label>
-- Plug 'easymotion/vim-easymotion'
map("n", "<Leader>", "<Plug>(easymotion-prefix)", {noremap = false})
-- 2-char search: s{char}{char} ...{label}
map("n", "s", "<Plug>(easymotion-overwin-f2)")
-- Make easymotion match the new mnei(hjkl) motions
map("n", "<Leader>m", "<Plug>(easymotion-linebackward)")
map("n", "<leader>n", "<Plug>(easymotion-j)")
map("n", "<leader>e", "<Plug>(easymotion-k)")
map("n", "<Leader>i", "<Plug>(easymotion-lineforward)")

-- Plug 'tpope/vim-commentary'
-- now b3nj5m1n/kommentary
-- map("n", "<leader>/", ":Commentary<cr>")
map("n", "<leader>/", "<Plug>kommentary_line_default")


-- Blank template
-- map("n", "", "")
