-- Format on Save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { lsp_fallback = true, bufnr = args.buf }
  end,
})
