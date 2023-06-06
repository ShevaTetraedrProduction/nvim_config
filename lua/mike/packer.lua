-- Load Packer
vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

-- Auto-compile and auto-clean
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerClean]]

-- Function to install and configure a package
local function ins(repo, name, requires)
	if name == nil then
		-- If the name parameter is not provided, use the last part of the repo as the name
		name = string.match(repo, '[^/]+$')
	end

	local use_opts = {}

	if requires ~= nil then
		use_opts = requirements
		-- Loop through the optional requirements and add them to the `use_opts` table
		-- for _, req in ipairs(requires) do
			-- table.insert(use_opts, { req, opt = true })
		-- end
	end


	packer.use {
		repo,            -- Repository name (e.g. 'lewis6991/gitsigns.nvim')
		as = name,       -- Package name (e.g. 'gitsigns')
		requires = use_opts,  -- Optional requirements
		config = function()
			-- Attempt to load the package
			local ok, plugin = pcall(require, name)

			-- If the package was loaded successfully and has a `setup()` function, call it
			if ok and type(plugin.setup) == 'function' then
				plugin.setup()
			end
		end
	}
end


-- Define plugins
packer.startup(function()

	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- use 'nvim-tree/nvim-web-devicons'
	ins('lukas-reineke/indent-blankline.nvim', 'plugins.indent_blankline')

	use('glepnir/dashboard-nvim')

	-- Fuzzy Finder
	-- ins('nvim-telescope/telescope.nvim', nil, {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}})
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	--NeoMake 
	use { 'neomake/neomake', run = function() vim.cmd('UpdateRemotePlugins') end }

  -- Git
  -- ins('lewis6991/gitsigns.nvim','gitsigns', nil)
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup{} end
  }

  use {
    "ahmedkhalf/jupyter-nvim",
    run = ":UpdateRemotePlugins",
    config = function()
      require("jupyter-nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use 'nvim-treesitter/nvim-treesitter' -- A syntax tree sitter

	-- Theme
	-- use 'folke/tokyonight.nvim'
	use {'sainnhe/everforest'}
	use {'EdenEast/nightfox.nvim'}
	use {'sainnhe/sonokai'}
	use {'gruvbox-community/gruvbox'}


	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require('plugins.lualine').setup{} end
	}

	-- ChatGPT
	-- https://github.com/jackMort/ChatGPT.nvim
	-- use({
	-- "jackMort/ChatGPT.nvim",
	-- config = function() require("chatgpt").setup({}) end,
	-- requires = {
	-- "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim",
	-- "nvim-telescope/telescope.nvim"
	-- }
	-- })


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


	-- ins('folke/which-key.nvim', 'which-key')
	use {
		'folke/which-key.nvim',
		config = function() require('which-key').setup{} end
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

	-- use { 'RishabhRD/nvim-lsputils', requires = {'neovim/nvim-lspconfig'} }

	use { 'kyazdani42/nvim-tree.lua',requires = 'kyazdani42/nvim-web-devicons'} 

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
	-- use {
	-- "folke/trouble.nvim",
	-- requires = "nvim-tree/nvim-web-devicons",
	-- config = function()
	-- require("plugins.trouble").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	-- }
	-- end
	-- }


	-- Syntax highlighting
	-- use 'sheerun/vim-polyglot'

	-- Tree File Explorer
	ins('preservim/nerdtree', 'plugins.nerdtree', { 'ryanoasis/vim-devicons' })


	-- Install and configure nvim-bufferline.lua
	use {
		'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			-- require('plugins.bufferline')
		end
	}

	-- Install and configure nvim-compe
	-- use {'hrsh7th/nvim-compe', requires = 'hrsh7th/vim-vsnip'}

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


	-- Completion plugin
	use {'hrsh7th/nvim-compe', config = function()
		require'compe'.setup {
			enabled = true;
			autocomplete = true;
			debug = false;
			min_length = 1;
			preselect = 'always';
			throttle_time = 80;
			source_timeout = 200;
			incomplete_delay = 400;
			max_abbr_width = 100;
			max_kind_width = 100;
			max_menu_width = 100;
			documentation = true;

			source = {
				path = true;
				buffer = true;
				calc = true;
				nvim_lsp = true;
				nvim_lua = true;
			};
		}
	end}

  -- Linting plugin
  use {'dense-analysis/ale'}

  -- LSP plugin
  use {'neovim/nvim-lspconfig'}


	-- LSP signature plugin
	-- use {
		-- 'ray-x/lsp_signature.nvim',
		-- config = function()
			-- require('lsp_signature').setup{
				-- bind = true,
				-- handler_opts = {
					-- border = "single"
				-- },
				-- hint_enable = false,
				-- doc_lines = 0,
			-- }
		-- end
	-- }

	-- Documentation lookup
	use 'kkoomen/vim-doge'

	-- Install and load nvim-lspconfig
	-- use {
		-- 'neovim/nvim-lspconfig',
		-- config = function()
			-- require('lspconfig').pylsp.setup{
				-- plugins = {
					-- Enable pyls-mypy plugin
					-- pyls_mypy = {
						-- enabled = true,
						-- live_mode = true,
					-- },
				-- },
			-- }
		-- end
	-- }
	-- Mason
	-- use 'ludovicchabant/vim-mason'

	--use 'altercation/vim-colors-solarized'
	-- use 'lifepillar/vim-solarized8'

end)
