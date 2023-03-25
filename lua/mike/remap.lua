-- n, v, i, t = mode names

vim.g.mapleader = " "


-- vim.keymap.set("n", "<leader>b", ":colorscheme blue<CR>")
-- vim.keymap.set("n", "<leader>f", ":colorscheme nightfox<CR>")

vim.keymap.set("n", "<leader>cg", ":colorscheme gruvbox<CR>")

-- Reload current file
vim.keymap.set("n", "<leader>r", ":w | so %<CR>")


-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")


-- Save and Quit
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>qq", ":qall<CR>")


-- Commenting
vim.keymap.set("n", "<leader>ct", ":Commentary<CR>")
vim.keymap.set("v", "<leader>ct", ":Commenttary<CR>")

-- Insert mode mappings
-- Exit insert mode and move to beginning of line
vim.keymap.set("i", "<C-b>", "<Esc>^i")
-- Move to end of line
vim.keymap.set("i", "<C-e>", "<End>")

-- Create new vertical split
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
-- Create new horizontal split
vim.keymap.set("n", "<leader>s", ":split<CR>")
-- Toggle terminal window
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")


-- Save file
vim.keymap.set("n", "<leader>w", ":write<CR>")
-- Quit file
vim.keymap.set("n", "<leader>q", ":quit<CR>")
-- Quit all files
vim.keymap.set("n", "<leader>qq", ":qall<CR>")

-- Open file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Enter command mode
vim.keymap.set("n", "<leader>;", ":")
-- Select all
vim.keymap.set("n", "<leader>a", "ggVG")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p')
-- Cut to system clipboard
vim.keymap.set("n", "<leader>d", '"+d')
-- Delete to system clipboard
vim.keymap.set("n", "<leader>x", '"+x')

-- Open new tab
vim.keymap.set("n", "<leader>z", ":tabnew<CR>")

-- Switch to tab 1-9
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")

vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")



vim.api.nvim_set_keymap('n', '<leader>ss', ':Dashboard<CR>', {noremap = true, silent = true})

-- Find files using Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", {noremap = true, silent = true})

-- Live grep using Telescope
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})

-- List buffers using Telescope
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", {noremap = true, silent = true})

-- List commands using Telescope
vim.api.nvim_set_keymap('n', '<leader>fc', ":lua require('telescope.builtin').commands()<CR>", {noremap = true, silent = true})



-- Configure vim-slime
vim.g.slime_target = 'tmux'
vim.g.slime_python_ipython = 1
vim.g.slime_dont_ask_default = 1
vim.g.slime_default_config = {
  socket_name = 'default',
  target_pane = '{top-right}',
  target_session = '',
  comment_string = '// ',
  cmd = {'tmux', 'send-keys', '-t', '{top-right}', '%s', 'Enter'},
}

-- Define keybindings for vim-slime
vim.api.nvim_set_keymap('n', '<Leader>s', ':SlimeSend<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>S', ':SlimeSend1<CR>', {noremap = true})


