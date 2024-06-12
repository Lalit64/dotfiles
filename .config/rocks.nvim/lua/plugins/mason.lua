require("plugins.lsp")

local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
  ui = {
    border = "rounded",
    width = 0.6,
    height = 0.85
  }
})
mason_lspconfig.setup({
  ensure_installed = {
    "html",
    "cssls",
    "svelte",
    "tsserver",
    "tailwindcss",
    "astro",
    "clangd",
    "emmet_language_server",
    "jsonls"
  },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({})
    end,
  }
})
