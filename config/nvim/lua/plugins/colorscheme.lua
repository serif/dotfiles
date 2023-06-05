return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "doums/darcula" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darcula",
    },
  },
}
