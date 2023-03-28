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
 

  -- use 'nvim-tree/nvim-web-devicons'

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }


  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'nvim-treesitter/nvim-treesitter' -- A syntax tree sitter
  use 'neovim/nvim-lspconfig' -- LSP configuration

  -- Theme
  -- use 'folke/tokyonight.nvim'
  use {'sainnhe/everforest'}
  use {'EdenEast/nightfox.nvim'}
  use {'sainnhe/sonokai'}
  use {'gruvbox-community/gruvbox'}


  -- Install the Galaxyline plugin
  -- use {
    -- 'glepnir/galaxyline.nvim', branch = 'main',
    -- config = function() require('galaxyline') end
  -- }
  
  -- use {
    -- 'hoob3rt/lualine',
    -- config = function()
      -- require('lualine').setup{}
    -- end
  -- }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('plugins.lualine').setup{} end
  }

    -- Misc
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- DASHBOARD 
  -- use 'glepnir/dashboard-nvim'
  -- use {
    -- 'glepnir/dashboard-nvim',
    -- config = function ()
      -- require('plugins/dashboard').setup()
      -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
    -- end
   -- }

-- use {
  -- 'glepnir/dashboard-nvim',
  -- event = 'VimEnter',
  -- requires = {'nvim-tree/nvim-web-devicons'}
-- }



  -- Whichkey
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end
  }

  -- Tagbar
  use 'preservim/tagbar'

  -- Toggle term
  use {
    'akinsho/nvim-toggleterm.lua',
    tag = "*",
    config = function()
      require('toggleterm').setup{}
    end
  }

  -- Python Development
  use 'python-mode/python-mode'

  use { 'RishabhRD/nvim-lsputils', requires = {'neovim/nvim-lspconfig'} }
  
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  } 
 
  -- Hardline
  -- use {'ojroques/nvim-hardline'}
  -- use {'tami5/nvim-hardware-status'}


  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }


  use 'sindrets/diffview.nvim'


  -- Trouble Lua
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }


  -- Syntax highlighting
  use 'sheerun/vim-polyglot'
  
  -- Tree File Explorer
  use {
  'preservim/nerdtree',
  requires = { 'ryanoasis/vim-devicons' },
  config = function()
    -- Load NERDTree configuration
    require('plugins.nerdtree')
  end
  }

 
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


   -- LSP signature plugin
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup{
        bind = true,
        handler_opts = {
          border = "single"
        },
        hint_enable = false,
        doc_lines = 0,
      }
    end
  }

  -- Documentation lookup
  use 'kkoomen/vim-doge'
  
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
