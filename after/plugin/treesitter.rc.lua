local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = { },
  },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "embedded_template",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "ruby",
    "rust",
    "vim",
    "yaml",
  },
  autotag = {
    enable = true,
  },
}

require "nvim-treesitter.parsers".get_parser_configs()

