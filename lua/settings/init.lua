-- vim options

local st = vim.opt

st.expandtab = true
st.smarttab = true
st.shiftwidth = 2
st.tabstop = 2


st.colorcolumn = '100'
st.so=999
st.relativenumber = true



st.splitright = true
st.splitbelow = true
st.clipboard = 'unnamedplus'
--Autocompleat default
st.completeopt = 'menuone,noinsert,noselect'

st.syntax = "ON"
st.hidden = true
st.termguicolors = true

st.number = true
--st.clipboard='unnamedplus'
--st.mouse = "a"

vim.api.nvim_set_keymap('n', '<c-P>',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })

st.errorformat = vim.opt.errorformat + '%f|%l col %c|%m'
vim.cmd [[colorscheme nordfox]]
vim.cmd [[set mouse=a]]
vim.cmd [[TSToggle highlight]]
-- don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

--the last change
vim.cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)
