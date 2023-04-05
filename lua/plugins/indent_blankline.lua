require('indent_blankline').setup {
  char = '|', -- Use a different character for the indent line
  show_trailing_blankline = false, -- Don't display a line for trailing whitespace
  buftype_exclude = {'terminal'}, -- Don't display lines in the terminal buffer
  use_treesitter = true, -- Use treesitter to determine indentation levels
  space_char_blankline = ' ', -- Use a space character for blank lines
  show_current_context = true, -- Highlight the current indentation level
  context_patterns = {'class', 'function', 'method'}, -- Patterns to highlight for context
}
