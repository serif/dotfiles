-- lua/plugins/colorscheme.lua
return {
  {
    "santos-gabriel-dario/darcula-solid.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.cmd.colorscheme("darcula-solid")
    end,
  },
}
