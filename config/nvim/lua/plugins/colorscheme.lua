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

-- changes made to
-- ~/.local/share/nvim/lazy/darcula-solid.nvim/lua/lush_theme/darcula-solid.lua
-- local fg = hsl(43, 30, 75)
-- local faded = hsl(43, 5, 30) -- non-important text elements
-- Statement({ fg = orange, gui = it }), -- (preferred) any statement
