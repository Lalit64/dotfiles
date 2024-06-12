local opts = {
  formatters = {
    svelte_fmt = {
      command = "/opt/homebrew/bin/prettier",
      args = { "--write", "--plugin", "prettier-plugin-svelte", "$FILENAME" },
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    svelte = { "svelte_fmt" },
    javascript = { { "prettier", "prettierd" } },
    typescript = { { "tsserver", "prettierd" } },
  },
}

require("conform").setup(opts)
