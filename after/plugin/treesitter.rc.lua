local install_status, ts_install = pcall(require, "nvim-treesitter.install")
if (not install_status) then return end
  ts_install.update({ with_sync = true })

local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
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
    "help",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "ruby",
    "rust",
    "typescript",
    "vim",
    "yaml",
  },
  autotag = {
    enable = true,
  },


}

require "nvim-treesitter.parsers".get_parser_configs()

