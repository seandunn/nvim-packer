-- BASE SETTINGS --
vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.cmd.set("spell")

vim.wo.number = true

vim.opt.mouse = 'a'
vim.g.mapleader = ' '

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

--vim.opt.title = true -- this beggar randomly prints the filename across the screen!
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 1
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.undofile = true

vim.opt.inccommand = 'nosplit'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.cmd.set("splitbelow")
vim.cmd.set("splitright")

-- HIGHLIGHTS --
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 10
vim.opt.background = 'dark'
vim.o.signcolumn = 'yes'


-- cursorline
vim.api.nvim_create_autocmd("WinEnter", { pattern = '*', command = "set cursorline" })
vim.api.nvim_create_autocmd("WinLeave", { pattern = '*', command = "set nocursorline" })

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", { pattern = '*', command = "set nopaste" })

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Term --
vim.api.nvim_create_autocmd("TermOpen", { pattern = '*', command = "setlocal nonumber norelativenumber" })

-- Start in insert mode when opening a new terminal buffer
-- Remember if we are in insert mode for each terminal buffer
vim.api.nvim_create_autocmd("TermOpen", { pattern = '*', command = "startinsert" })
vim.api.nvim_create_autocmd("TermEnter ", { pattern = '*', command = [[ let b:insertMode = "yes" ]] })
vim.api.nvim_create_autocmd("BufEnter", { pattern = 'term://*', command = "startinsert" } )

-- Unused Providers --
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

require('plugins')
vim.cmd.colorscheme("slate") -- Fallback colorscheme
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")

-- MAPPINGS --
-- Open Config file
vim.keymap.set('n', '<leader>,v', ':tabe ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>,p', ':tabe ~/.config/nvim/lua/plugins.lua<CR>')

-- Copy/Paste/Clipboard
-- vim.opt.clipboard = 'unnamedplus' -- points unnamed regs at system clipboard
vim.keymap.set('v', '<leader>c', '"+y')

-- Neotree --
vim.keymap.set('n', '<leader>n', ':Neotree toggle=true reveal=true<CR>')

-- Windows --
-- Simplify moving from window to window
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]])
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]])

vim.keymap.set('n', '<C-w>z', ':WindowsMaximize<CR>')
vim.keymap.set('n', '<C-w>=', ':WindowsEqualize<CR>')

-- Term --
vim.keymap.set("t", "<A-o>", [[<C-\><C-n>:tabe<CR>:term<CR>]])
vim.keymap.set("n", "<A-o>", [[<C-\><C-n>:tabe<CR>:term<CR>]])

-- Tabs --
-- Since the vim shortcut gt and gT is tricky in terminal
vim.keymap.set({ "n", "t" }, "<A-PageUp>",   [[<C-\><C-n>:tabprevious<CR>]])
vim.keymap.set({ "n", "t" }, "<A-PageDown>", [[<C-\><C-n>:tabnext<CR>]])

-- Visual Move text --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste, sending deleted text to unnamed buffer
vim.keymap.set("x", "<leader>v", [["_dP]])

-- Safety first
vim.keymap.set("n", "Q", "<nop>")

