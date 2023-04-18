vim.g.neomake_enabled_makers = { 'python' }
vim.g.neomake_async = 1
vim.g.neomake_open_list = 2
vim.g.neomake_close_list = 2

vim.g.neomake_python_flake8_maker = {
  exe = 'flake8',
  args = { '--quiet', '--ignore=E501', '-' },
  stdin = true,
  cwd = vim.loop.cwd,
}
