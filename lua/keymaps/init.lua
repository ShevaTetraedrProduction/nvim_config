-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, key, command, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, command, options)
end

local function nm(key, command, opts) map('n', key, command, opts) end
local function im(key, command, opts) map('i', key, command, opts) end
local function vm(key, command, opts) map('v', key, command, opts) end
local function tm(key, command, opts) map('t', key, command, opts) end

-- 'n' --> for Normal(ESC) mode 
-- 'i' --> for Insert mode
-- 't' --> for hot key for terminal
-- 'v' --> for Visual mode
vim.g.mapleader = ','


nm('<leader>q', ':q<CR>')

nm('<leader>t', ':NvimTreeToggle<CR>')
im('<leader>t', '<C-c>:NvimTreeToggle<CR>')

nm('<leader>`', ':ToggleTerm<CR>')
im('<leader>`', '<C-c>:ToggleTerm<CR>')

nm('<leader>s', ':w<CR>')
im('<leader>s', '<C-c>:w<CR>')

nm('<leader><right>', ':vsp<CR>')
nm('<leader><right>', ':vsp<CR>')

nm('<leader><down>', ':sp<CR>')
im('<leader><down>', ':sp<CR>')

nm('<leader>p', ':!pythone3 %<CR>')
-- map('n', 'term', 'ToggleTerm direction=horizontal')
nm('<leader>l', ':luafile %<CR>')
 
nm('<Tab>', ':BufferLineCycleNext<CR>', default_opts)
nm('<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)


-- go to begin or end
im('<C-E>', '<ESC>A')
im('<C-A>', '<ESC>I')


-- Move around splits using Ctrl + {h,j,k,l}
nm('<C-h>', '<C-w>h')
nm('<C-j>', '<C-w>j')
nm('<C-k>', '<C-w>k')
nm('<C-l>', '<C-w>l')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
nm('<C-t>', ':Term<CR>', { noremap = true })  -- open
tm('<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
--nm('<C-n>', ':NvimTreeToggle<CR>')            -- open/close
nm('<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
nm('<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
nm('<leader>z', ':TagbarToggle<CR>')          -- open/close

nm('<leader>ff', ':FzfLua<CR>')

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
