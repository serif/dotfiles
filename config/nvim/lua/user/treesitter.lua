local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- one of "all", "maintained" (parsers with maintainers), or list of langs
  ensure_installed = {
    "bash",
    "cmake",
    "css",
    "html",
    "java",
    "javascript",
    "json",
    "kotlin",
    "lua",
    "make",
    "markdown_inline",
    "norg",
    "python",
    "regex",
    "scss",
    "typescript",
    "vim",
    "yaml"
    },
  sync_install = true, -- applies to ensure_installed
  ignore_install = { "markdown" }, -- list of parsers to ignore installing
  autopairs = {
    enable = true,
    },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
    },
  indent = {
    enable = true,
    disable = { "yaml" }
    },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors: not working, maybe overridden by theme?
    colors = { "#FF0000", "#FF0000", "#FF0000", "#FF0000", "#FF0000", "#FF0000", "#FF0000",} -- table of hex strings
    -- termcolors = {'cyan', 'green', 'pink', 'orange'} -- table of colour name strings
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    },
}
