
vim.g.mapleader = " "

function toggleNumber()
  vim.opt.number = not vim.opt.number:get()
  -- vim.fn["which_key#register"]("<leader>cg", { ":<C-U>lua toggleNumber()<CR>", "Toggle number visibility" })
end
-- Toggle line numbers and IndentBlankline plugin on and off
function toggle_display()
  vim.wo.number = not vim.wo.number -- toggle line numbers
  -- vim.wo.number = false
  -- if vim.wo.number == true then
    -- vim.wo.number = false
  -- else
    -- vim.wo.number = true
  -- end
  -- vim.wo.relativenumber = not vim.wo.relativenumber -- toggle relative line numbers
  vim.cmd('IndentBlanklineToggle') -- toggle IndentBlankline plugin
end



-- Function to maximize or restore panel
local is_maximized = false

function ToggleMaximize()
  if not is_maximized then
    vim.cmd('wincmd _')
    vim.cmd('wincmd |')
    vim.cmd('wincmd +')
    vim.cmd('wincmd +')
    is_maximized = true
  else
    vim.cmd('wincmd =')
    is_maximized = false
  end
end




local function kmap(mode, lhs, rhs, description, attr)
  attr = attr or {noremap = true, silent = true}
  vim.keymap.set(mode, lhs, rhs, attr)
end

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local bpython = Terminal:new({ cmd = "bpython", hidden = true, direction = "float", })
function _lazygit_toggle() lazygit:toggle() end
function _bpython_toggle() bpython:toggle() end

local function kmapp(mode, lhs, rhs, description)
  vim.keymap.set(mode, lhs, rhs, {noremap = true, silent = true})
  if description then
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, {noremap = true, silent = true, expr = false, nowait = false})
    vim.api.nvim_buf_set_var(0, 'which_key_map', {lhs, description})
  end
end

-- Define kmap function with description
local function kmappp(mode, lhs, rhs, desc)
    local opts = {noremap = true, silent = true}
    if desc then
        opts = vim.tbl_extend('force', opts, {expr = false, nowait = true})
        local key = table.concat(vim.fn.split(lhs, '\\'), '')
        local buf = 0
        vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, opts)
        vim.api.nvim_buf_set_var(buf, 'which_key_map', {[key] = desc})
    else
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
end

-- Theme
kmapp('n', '<leader>cb', ':colorscheme darkblue<CR>', 'Theme darkblue')
kmap('n', '<leader>cg', ':colorscheme gruvbox<CR>', 'Theme gruvbox')
kmap('n', '<leader>ce', ':colorscheme everforest<CR>', 'Theme everforest')
kmap('n', '<leader>cn', ':colorscheme nightfox<CR>', 'Theme nightfox')
kmap('n', '<leader>cs', ':colorscheme sonokai<CR>', 'Theme somokai')


kmap('n', '<leader>du', ':undojoin<CR>', { noremap = true, silent = true })


-- vim.api.nvim_set_keymap("n", "<leader>cn", ":lua toggleNumber()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>cg", ":lua toggleNumber()<CR>", {noremap = true, silent = true, nowait = true}, {description = "Toggle line numbers"})
-- vim.keymap.nnoremap { "<leader>cn", function() toggleNumber() end, silent = true, nowait = true, description = "Toggle line numbers" }

-- Define a key mapping to toggle the file explorer
-- vim.api.nvim_set_keymap
kmap('n', '<leader>e', ':NERDTreeToggle<CR>', 'Tree', { noremap = true, silent = false })


kmap('n', '<leader>mm', ':lua ToggleMaximize()<CR>', { noremap = true, silent = true })

-- Reload current file
kmap("n", "<leader>rl", ":so $MYVIMRC<CR><CR>")


-- Window navigation
kmap("n", "<C-h>", "<C-w>h")
kmap("n", "<C-j>", "<C-w>j")
kmap("n", "<C-k>", "<C-w>k")
kmap("n", "<C-l>", "<C-w>l")


-- Save and Quit
kmap("n", "<leader>w", ":w<CR>")
kmap("n", "<leader>q", ":q<CR>")
kmap("n", "<leader>qq", ":qall<CR>")


-- Commenting
kmap("n", "<leader>cc", ":Commentary<CR>")
kmap("v", "<leader>cc", ":Commenttary<CR>")

-- Insert mode mappings
-- Exit insert mode and move to beginning of line
kmap("i", "<C-b>", "<Esc>^i")
-- Move to end of line
kmap("i", "<C-e>", "<End>")

-- Create new vertical split
kmap("n", "<leader>v", ":vsplit<CR>")
-- Create new horizontal split
kmap("n", "<leader>s", ":split<CR>")
-- Toggle terminal window
kmap("n", "<leader>tf", ":ToggleTerm size=20 dir=. direction=float<CR>")
kmap("n", "<leader>tt", ":ToggleTerm size=20 dir=. direction=horizontal<CR>")
kmap('t', '<esc>', '<C-\\><C-n>', {noremap = true})
kmap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
kmap("n", "<leader>tb", "<cmd>lua _bpython_toggle()<CR>", {noremap = true, silent = true})

-- Save file
kmap("n", "<leader>w", ":write<CR>")
-- Quit file
kmap("n", "<leader>q", ":quit<CR>")
-- Quit all files
kmap("n", "<leader>qq", ":qall<CR>")


-- Enter command mode
kmap("n", "<leader>;", ":")
-- Select all
kmap("n", "<leader>a", "ggVG")

-- Copy to system clipboard
kmap("n", "<leader>y", '"+y')
-- Paste from system clipboard
kmap("n", "<leader>p", '"+p')
-- Cut to system clipboard
kmap("n", "<leader>d", '"+d')
-- Delete to system clipboard
kmap("n", "<leader>x", '"+x')

-- Open new tab
kmap("n", "<leader>tn", ":tabnew<CR>")

-- Switch to tab 1-9
kmap("n", "<leader>1", "1gt")
kmap("n", "<leader>2", "2gt")
kmap("n", "<leader>3", "3gt")
kmap("n", "<leader>4", "4gt")
kmap("n", "<leader>5", "5gt")

kmap("n", "<leader>ps", ":PackerSync<CR>")


-- Resize the current window horizontally
kmap('n', '<C-w>l', ':vertical resize +5<CR>', { noremap = true, silent = true })
kmap('n', '<C-w>h', ':vertical resize -5<CR>', { noremap = true, silent = true })

-- Resize the current window vertically
kmap('n', '<C-w>j', ':resize +5<CR>', { noremap = true, silent = true })
kmap('n', '<C-w>k', ':resize -5<CR>', { noremap = true, silent = true })

-- Resize the current window to a specific height/width
kmap('n', '<S-Right>', ':vertical resize -10<CR>', { noremap = true, silent = true })
kmap('n', '<S-Left>', ':vertical resize +10<CR>', { noremap = true, silent = true })
kmap('n', '<S-Up>', ':resize -10<CR>', { noremap = true, silent = true })
kmap('n', '<S-Down>', ':resize +10<CR>', { noremap = true, silent = true })

kmap('n', '<Leader>td', ':lua toggle_display()<CR>', { noremap = true, silent = true })



vim.api.nvim_set_keymap('n', '<leader>ss', ':Dashboard<CR>', {noremap = true, silent = true})

-- Find files using Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", {noremap = true, silent = true})

-- Live grep using Telescope
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})

-- List buffers using Telescope
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", {noremap = true, silent = true})

-- List commands using Telescope
vim.api.nvim_set_keymap('n', '<leader>fc', ":lua require('telescope.builtin').commands()<CR>", {noremap = true, silent = true})


-- Go to definition
kmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- Go to type definition
kmap('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- Find references
kmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- Rename symbol
kmap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- Show documentation
kmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
kmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
-- Code actions
kmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- Formatting
kmap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- Define a custom key map to trigger signature help
vim.api.nvim_set_keymap('n', '<Leader>k', '<cmd>lua require("lsp_signature").signature_help()<CR>', { noremap = true, silent = true })




