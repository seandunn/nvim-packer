local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end


telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
}

vim.keymap.set('n', '<leader>tf', function()
  builtin.find_files()
end)

vim.keymap.set('n', '<leader>ts', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>tt', function()
  builtin.treesitter()
end)

vim.keymap.set('n', '<C-p>', function()
  builtin.git_files()
end)

vim.keymap.set('n', '<leader>tr', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '<leader>tb', function()
  builtin.buffers()
end)
vim.keymap.set('n', '<leader>th', function()
  builtin.help_tags()
end)

vim.keymap.set('n', '<leader>to', function()
  builtin.oldfiles()
end)
vim.keymap.set('n', '<leader>t<space>', function()
  builtin.resume()
end)
vim.keymap.set('n', '<leader>te', function()
  builtin.diagnostics()
end)
