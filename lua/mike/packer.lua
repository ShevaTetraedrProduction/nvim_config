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

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Theme
  -- use 'folke/tokyonight.nvim'
  use {'sainnhe/everforest'}
  use {'EdenEast/nightfox.nvim'}
  use {'sainnhe/sonokai'}
  use {'gruvbox-community/gruvbox'}
  
    -- Misc
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- DASHBOARD  
  -- use {
    -- 'goolord/alpha-nvim',
    -- config = function ()
      -- require('plugins/dashboard')
      -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
    -- end
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

  -- DASHBOARD
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
        config = {
          center = {
            {
              icon = '',
              icon_hl = 'group',
              desc = 'description',
              desc_hl = 'group',
              key = 'shortcut key in dashboard buffer not keymap !!',
              key_hl = 'group',
              action = '',
            },
          },
          footer = {},
        }
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
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
