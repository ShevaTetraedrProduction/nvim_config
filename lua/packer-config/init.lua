local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
  --colorscheme
  use 'EdenEast/nightfox.nvim'
 
  -- nvim-tree
  --use 'kyazdani42/nvim-web-devicons'
  --use 'kyazdani42/nvim-tree.lua'
  
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
  end}

  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
    }
  end
  }

  --use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly'   
  }
  
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  use { 'majutsushi/tagbar' }      -- code structure
  use { 'Yggdroot/indentLine' }    -- see indentation
  use {'dense-analysis/ale'}       -- Linter/

  -- information rows abow and below
  use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
        require('lualine').setup()
      end, }

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require("bufferline").setup{}
  end, }


  use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require'telescope'.setup {} end, 
  }
  
  
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -- Автодополнялка
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  --- Автодополнлялка к файловой системе
  use 'hrsh7th/cmp-path'
  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'

  -----------------------------------------------------------
  -- PYTHON
  -----------------------------------------------------------
  --- Шапка с импортами приводим в порядок
  -- use 'fisadev/vim-isort'
  -- Поддержка темплейтом jinja2
  use 'mitsuhiko/vim-jinja'
  use 'dense-analysis/ale' 


    -- After this everything for my test
  -- Icons for autocompleat
  --use {
    --'onsails/lspkind-nvim',
    --config = function()
      --require('plugins/lspkind')
    --end
	--}

  --
  --COMENTS
  use { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end }
 
  use { 'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {'tzachar/cmp-tabnine', run='./install.sh'}

end)
