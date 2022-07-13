local options = {
  -- Editor
    cmdheight = 1,            -- Height of neovim command line
    colorcolumn = "81",       -- Visual soft margin
    cursorline = false,       -- Highlight the current line
    hlsearch = true,          -- Highlight all matches on previous search pattern
    inccommand = "nosplit",   -- Live preview for :%s/search/replace
    incsearch = true,         -- Begin searching immediately
    listchars = "tab:»·,trail:·", -- Display of tabs and trailing spaces
    list = true,              -- Enable display tabs and trailing spaces
    number = true,            -- Show numbered lines
    relativenumber = false,   -- Set relative numbered lines
    numberwidth = 4,          -- Set number column width to 2 {default 4}
    pumheight = 10,           -- Pop up menu height
    scrolloff = 5,            -- Line offset for cursor when scrolling
    showmode = true,          -- Show NORMAL, INSERT, etc
    sidescrolloff = 5,        -- Horizontal offset for cursor when scrolling
    signcolumn = "no",        -- Always show sign column?
    splitbelow = true,        -- Horizontal splits below current window
    splitright = true,        -- Vertical split to right of current window
  -- Wrap
    wrap = true,              -- Wrap text
    linebreak = true,         -- Only break at word boundaries
    textwidth = 0,            -- 0 to keep wrap visual only
    wrapmargin = 0,           -- 0 to keep wrap visual only
  -- Tabs
    autoindent = true,        -- Autoindent new lines
    expandtab = true,         -- Convert tabs to spaces
    smartindent = true,       -- Make indenting smarter again
    smarttab = true,          -- Smart indent and delete
    shiftwidth = 4,           -- Spaces inserted for each indent
    showtabline = 2,          -- Always show tabs
    softtabstop = 4,          -- Visual spaces for actual tab characters in file
    tabstop = 4,              -- Insert 4 spaces for a tab
  -- Behavior
    backup = false,           -- No backup before write
    clipboard = "unnamedplus",-- Use system clipboard
    completeopt = { "menuone", "noselect" }, -- for cmp
    conceallevel = 0,         -- So that `` is visible in markdown files
    fileencoding = "utf-8",   -- The encoding written to a file
    formatoptions = "jcrol",  -- r/j: auto add/del comment leaders
    guifont = "JetBrains Mono:h15", -- font in graphical neovim applications
    hidden = true,            -- Don't close hidden buffers
    hlsearch = true,          -- Hilight search results
    ignorecase = true,        -- Ignore case in search patterns
    iskeyword = "@,48-57,_,192-255,-", -- IDK
    lazyredraw = true,        -- Redraw only when needed
    mouse = "a",              -- Allow the mouse to be used in neovim
    errorbells = false,       -- Silence error bells
    shortmess = "atAIc",      -- Shorten status line msgs, hide some msgs
    showcmd = true,           -- Show commands sent via keymap
    smartcase = true,         -- Smart case
    swapfile = false,         -- Creates a swapfile
    termguicolors = true,     -- Set term gui colors
    timeoutlen = 200,         -- Wait time for key sequence to complete, in ms
    undofile = true,          -- Enable persistent undo
    undolevels = 512,         -- Undo levels
    undoreload = 128,         -- Undo levels to reload
    updatetime = 300,         -- Faster completion (4000ms default)
    whichwrap = "<,>,h,l",    -- Wrap cursor on arrows and h, l movement
    writebackup = false,      -- Create backup before attempting save
    wildmenu = true,          -- Visual command autocomplete
    wildignore = "*.swp,*.bak,*.pyc,*.class,tags",
  --
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.opt.iskeyword:append("-") done already above, left here for syntax fyi
