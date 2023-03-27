-- Set up dashboard
vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_header = {
  ' ██████╗ ██╗   ██╗ █████╗ ██╗     ██████╗ ██╗   ██╗███████╗██████╗ ',
  '██╔════╝ ██║   ██║██╔══██╗██║     ██╔══██╗██║   ██║██╔════╝██╔══██╗',
  '██║  ███╗██║   ██║███████║██║     ██████╔╝██║   ██║█████╗  ██████╔╝',
  '██║   ██║██║   ██║██╔══██║██║     ██╔══██╗██║   ██║██╔══╝  ██╔══██╗',
  '╚██████╔╝╚██████╔╝██║  ██║███████╗██████╔╝╚██████╔╝███████╗██║  ██║',
  ' ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝',
}

vim.g.dashboard_custom_footer = {
  'Neovim loaded in ' -- .. vim.fn.format('%s', vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))) .. ' seconds.'
}

vim.g.dashboard_custom_section = {
  a = { description = { '  Recently opened files          ' }, command = 'Telescope oldfiles' },
  b = { description = { '  Find File                      ' }, command = 'Telescope find_files' },
  c = { description = { '  Bookmarks                      ' }, command = 'Telescope marks' },
  d = { description = { '  Load last session              ' }, command = 'SessionLoad' },
}

-- Set up key mappings for dashboard
local dashboard_key_mappings = function()
  local opts = { noremap=true, silent=true }

  -- Open dashboard
  vim.api.nvim_set_keymap('n', '<leader>home', '<cmd>Dashboard<CR>', opts)
end

-- Attach key mappings to dashboard
require('dashboard').setup{}
dashboard_key_mappings()







