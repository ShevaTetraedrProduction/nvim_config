require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lspconfig = require('lspconfig')

lspconfig.pylsp.setup({})


lspconfig.pylsp.setup({
  settings = {
    python = {
      formatting = {
        provider = "yapf"
      }
    }
  },
  on_attach = function(client, bufnr)
    require('lsp_signature').on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "single"
      }
    }, bufnr)
  end,
})

