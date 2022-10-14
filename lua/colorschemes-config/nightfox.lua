--require('nightfox').load('nordfox')
local nightfox = require("nightfox")


nightfox.setup({
  options = {
    theme = 'nordfox',
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})
