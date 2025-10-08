-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- Quick return to normal mode
map("i", ",n", "<esc>l")
map("v", ",n", "<esc>l")

-- Clear current search highlight
map("n", "//", ":noh<CR>")

-- Raven layout
map("n", "n", "gj")
map("n", "e", "gk")
map("n", "a", "l")
map("n", "t", "i")
map("n", "T", "I")
map("n", "E", "e")
map("n", "i", "a")
map("n", "h", "n")
map("n", "H", "N")
map("n", "<C-n>", "<C-f>")
map("n", "<C-e>", "<C-b>")

map("v", "n", "gj")
map("v", "e", "gk")
map("v", "a", "l")
map("v", "t", "i")
map("v", "T", "I")
map("v", "E", "e")
map("v", "i", "a")
map("v", "h", "n")
map("v", "H", "N")
map("v", "<C-n>", "<C-f>")
map("v", "<C-e>", "<C-b>")
