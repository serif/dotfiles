
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- The function is called `t` for `termcodes`.
local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
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

-- Write all and quit
map("n", "<C-q>", ":wqa<CR>")

-- Write all
map("n", "<C-s>", ":wa<CR>")

-- Colemak_dhm: hjkl>mnei i>t
map("n", "m", "h")          -- move Left
map("n", "n", "gj")         -- move Down (g to allow move within wrapped lines)
map("n", "e", "gk")         -- move Up (g to allow move within wrapped lines)
map("n", "i", "l")          -- move Right
map("n", "t", "i")          -- (t)ype           replaces (i)nsert
map("n", "T", "I")          -- (T)ype at bol    replaces (I)nsert
map("n", "E", "e")          -- end of word      replaces (e)nd
map("n", "h", "n")          -- next match       replaces (n)ext
map("n", "k", "N")          -- previous match   replaces (N) prev

-- Visual Colemak_dhm
map("v", "m", "h")          -- move Left
map("v", "n", "gj")         -- move Down (g to allow move within wrapped lines)
map("v", "e", "gk")         -- move Up (g to allow move within wrapped lines)
map("v", "I", "l")          -- move Right - shifted to fix [v]isual[i]n[...]

-- Ctrl+up/down to page up/down
map("n", "<C-n>", "<C-f>M")  -- page down
map("n", "<C-e>", "<C-b>M")  -- page up, cursor up

-- Ctrl+left/right to switch between tabs
map("n", "[", ":tabprev<CR>")   -- go to tab previous
map("n", "]", ":tabnext<CR>")   -- go to tab next
map("n", "<C-m>", ":tabprev<CR>")   -- go to tab previous -- TODO
map("n", "<C-i>", ":tabnext<CR>")   -- go to tab next -- TODO
map("n", "j", ":tabnext<CR>")   -- go to tab next
map("n", "<Leader>1", "1gt")    -- go to tab 1
map("n", "<Leader>2", "2gt")    -- go to tab 2
map("n", "<Leader>3", "3gt")    -- go to tab 3
map("n", "<Leader>4", "4gt")    -- go to tab 4
map("n", "<Leader>5", "5gt")    -- go to tab 5
map("n", "<Leader>6", "6gt")    -- go to tab 6
map("n", "<Leader>7", "7gt")    -- go to tab 7
map("n", "<Leader>8", "8gt")    -- go to tab 8
map("n", "<Leader>9", "9gt")    -- go to tab 9
map("n", "<Leader>10", "10gt")  -- go to tab 10


-- Clear search highlight until next search
map("n", "//", ":noh<CR>")

-- Move text up/down TODO not working
map("v", "<S-e>", ":m -2<CR>==") -- TODO
map("v", "<S-n>", ":m +1<CR>==", {expr=true}) -- TODO


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
-- now b3nj5m1nbbb/kommentary
-- map("n", "<leader>/", ":Commentary<cr>")
-- map("n", "<leader>/", "<Plug>kommentary_line_default")
-- map("v", "<leader>/", "<Plug>kommentary_line_default")
map("n", "<leader>/", "<Plug>(comment_toggle_current_linewise)")
map("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

-- Telescope - fuzzy finder
map("n", "<Leader>f", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>g", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>tc", "<cmd>Telescope colorscheme<CR>")
map("n", "<Leader>tb", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>tq", "<cmd>Telescope quickfix<CR>")
map("n", "<Leader>tv", "<cmd>Telescope vim_options<CR>")
map("n", "<Leader>tt", "<cmd>Telescope treesitter<CR>")

-- Tree-Sitter - syntax highlighting and comprehension
-- below not necessary - added to treesitter.lua
-- map("n", "<C-t><C-s>", "<cmd>TSInstall bash cmake css html java javascript json kotlin lua make markdown_inline norg python regex scss typescript vim yaml<CR>")



-- Blank template
-- map("n", "", "")
