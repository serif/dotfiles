local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Packer (plugin manager) instlled. Please close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}




-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- Popup API from vim to lua in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  -- use "numToStr/Comment.nvim" -- Easily comment stuff
  -- use "b3nj5m1n/kommentary" -- Easily comment stuff
  -- use "kyazdani42/nvim-web-devicons"
  -- use "kyazdani42/nvim-tree.lua"
  -- use "akinsho/bufferline.nvim"
  -- use "moll/vim-bbye"
  -- use "nvim-lualine/lualine.nvim"
  -- use "akinsho/toggleterm.nvim"
  -- use "ahmedkhalf/project.nvim"
  -- use "lewis6991/impatient.nvim"
  -- use "lukas-reineke/indent-blankline.nvim"
  -- use "goolord/alpha-nvim"
  -- use "antoinemadec/FixCursorHold.nvim" -- fix lsp doc highlight
  -- use "folke/which-key.nvim"
  use "easymotion/vim-easymotion"   -- Mapped to <space><movement>
  use "p00f/nvim-ts-rainbow"        -- Rainbow brackets "luochen1990/rainbow"

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Color schemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"
  use "doums/darcula"
  use 'navarasu/onedark.nvim'

  -- Completion - cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions
  use "hrsh7th/cmp-nvim-lua" -- lua completions

  -- snippets - required by cmp_luasnip
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets for a ton of langs

  -- LSP - Language Server Protocol
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- lsp server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope - fuzzy finder
  use "nvim-telescope/telescope.nvim"

  -- Treesitter - intelligent syntax highlighting and code parsing
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/playground"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"




  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
