--mode: displays the current mode (e.g. NORMAL, INSERT, VISUAL, etc.).
--branch: displays the current Git branch.
--filename: displays the current file name.
--filetype: displays the current file type (e.g. lua, markdown, etc.).
--encoding: displays the current file encoding (e.g. utf-8, latin1, etc.).
--fileformat: displays the current file's line endings (e.g. LF or CRLF).
--location: displays the current file path and cursor position (e.g. ~/documents/myfile.txt:12).
--progress: displays the percentage of the current file that has been scrolled through.
--diagnostics: displays information about diagnostics (e.g. error, warning, hint) for the current buffer.
--diff: displays Git diff information for the current file.


-- Load Lualine and customize it
require('lualine').setup {
  options = {
    theme = 'nord',
    -- section_separators = '',
    component_separators = '|',

    -- section_separators = {'', ''},
    -- component_separators = {'', ''},
    icons_enabled = false,

  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {
      {'filetype'}, {'searchcount'}, {'hostname'},
      {'hardline.component', 'cpu', color = 'green', icon = ''},
      {'hardline.component', 'memory', color = 'yellow', icon = ''},
      {'hardline.component', 'battery', color = 'red', icon = ''},
      {'hardline.component', 'uptime', color = 'magenta', icon = '兩'},
      {'hardline.component', 'load_average', color = 'blue', icon = ''},

    },
   
    lualine_y = {'progress', 'location'},
    lualine_z = {
      function() return vim.fn.strftime('%b %d %X') end
     -- function() return vim.fn.strftime('%c') end
    }
  },
  extensions = {'fzf'},
}


