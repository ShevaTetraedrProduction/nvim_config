-- Load Packer
vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

-- Auto-compile and auto-clean
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerClean]]


-- Define plugins
packer.startup(function()
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'gruvbox-community/gruvbox'


  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  
    -- Misc
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  
  use {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }


  -- Whichkey
  use 'folke/which-key.nvim'

  -- Tagbar
  use 'preservim/tagbar'

  -- Python Development
  use 'python-mode/python-mode'

  use { 'RishabhRD/nvim-lsputils', requires = {'neovim/nvim-lspconfig'} }
  
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  } 
  
  -- Syntax highlighting
  use 'sheerun/vim-polyglot'


  use 'Shougo/deoplete.nvim'

  -- Code formatting
  use 'psf/black'

  -- Debugger
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      'mfussenegger/nvim-dap-python'
    }
  }

  -- Documentation lookup
  use 'kkoomen/vim-doge'
  
  -- snippet
  -- use "rafamadriz/friendly-snippets"


  -- Install and load nvim-lspconfig
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').pylsp.setup{
        plugins = {
          -- Enable pyls-mypy plugin
          pyls_mypy = {
            enabled = true,
            live_mode = true,
          },
        },
      }
    end
  }
  -- Mason
  -- use 'ludovicchabant/vim-mason'

  --use 'altercation/vim-colors-solarized'
  -- use 'lifepillar/vim-solarized8'

end)
