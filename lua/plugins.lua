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

  -- Colourschemes --
  use 'folke/tokyonight.nvim'
  use  'EdenEast/nightfox.nvim'

  use 'L3MON4D3/LuaSnip'

  -- LSP --
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'williamboman/mason-lspconfig.nvim'
  use 'williamboman/mason.nvim' -- Install/manage LSP servers

  -- Tree Sitter --
  use  'nvim-treesitter/nvim-treesitter'

  -- use  {
  --   'windwp/nvim-ts-autotag',
  --   requires = {
  --     'nvim-treesitter/nvim-treesitter'
  --   }
  -- }

  use  'kyazdani42/nvim-web-devicons'

  use  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Project tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  use  'windwp/nvim-autopairs'

  use  'norcalli/nvim-colorizer.lua'

  use 'akinsho/nvim-bufferline.lua'

  use 'lewis6991/gitsigns.nvim'

  use 'tpope/vim-fugitive' -- Classic Git frontend

  use  'numToStr/Comment.nvim'

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
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

