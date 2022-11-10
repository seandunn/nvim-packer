-- BASE SETTINGS --
vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.clipboard = 'unnamedplus' -- points unnamed regs at system clipboard

vim.wo.number = true

vim.opt.mouse = 'a'
vim.g.mapleader = ' '


vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 4
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.undofile = true
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.w.splitbelow = true
vim.w.splitright = true


-- PACKER --
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'EdenEast/nightfox.nvim'

  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
--  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim'

  -- use {
  --   'edluffy/hologram.nvim',
  --   run = require('hologram').setup{
  --   auto_display = true -- WIP automatic markdown image display, may be prone to breaking
  --   }
  -- }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'norcalli/nvim-colorizer.lua'
 -- use({
 --   "iamcco/markdown-preview.nvim",
 --   run = function() vim.fn["mkdp#util#install"]() end,
 -- })
  use 'akinsho/nvim-bufferline.lua'

  use 'lewis6991/gitsigns.nvim'

  use 'tpope/vim-fugitive'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'vimwiki/vimwiki'
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use {
    "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- cursorline
vim.api.nvim_create_autocmd("WinEnter", { pattern = '*', command = "set cursorline" })
vim.api.nvim_create_autocmd("WinLeave", { pattern = '*', command = "set nocursorline" })

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", { pattern = '*', command = "set nopaste" })

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Term
vim.api.nvim_create_autocmd("TermOpen", { pattern = '*', command = "setlocal nonumber norelativenumber" })

-- Start in insert mode when opening a new terminal buffer
-- Remember if we are in insert mode for each terminal buffer
vim.api.nvim_create_autocmd("TermOpen", { pattern = '*', command = "startinsert" })
vim.api.nvim_create_autocmd("TermEnter ", { pattern = '*', command = [[ let b:insertMode = "yes" ]] })
-- vim.api.nvim_create_autocmd("BufEnter", { pattern = 'term://*', command = "startinsert" } )

-- HIGHLIGHTS --
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 10
vim.opt.background = 'dark'
vim.o.signcolumn = 'yes'

require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
      dim_inactive = true
    }
  }
})
vim.cmd("colorscheme nightfox")

-- MAPPINGS --
-- Open Config file
vim.keymap.set('n', '<leader>,v', ':tabe ~/.config/nvim/init.lua<CR>')

-- Neotree
vim.keymap.set('n', '<leader>n', ':Neotree toggle=true reveal=true<CR>')

-- Simplify moving from split to split
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]])
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]])


vim.keymap.set("t", "<A-q>", [[<C-\><C-n>:let b:insertMode = 'no'<CR>]])
vim.keymap.set("t", "<A-o>", [[<C-\><C-n>:tabe<CR>:term<CR>]])
vim.keymap.set("n", "<A-o>", [[<C-\><C-n>:tabe<CR>:term<CR>]])

-- Tabs --
-- Since the vim shortcut gt and gT is tricky in terminal mode use the Firefox
-- tab shortcut instead.
vim.keymap.set("t", "<C-PageUp>", [[<C-\><C-n>:BufferLineCycleNext<CR>]])
vim.keymap.set("t", "<C-PageDown>", [[<C-\><C-n>:BufferLineCyclePrev<CR>]])

