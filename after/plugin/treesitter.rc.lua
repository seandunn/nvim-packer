local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "ruby",
    "rust",
    "toml",
    "vim",
    "yaml",
  },
  autotag = {
    enable = true,
  },
}

require "nvim-treesitter.parsers".get_parser_configs()

