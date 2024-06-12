vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    -- Require plugin configs which need to be lazy loaded here
    -- they should be in "plugins.lazy" folder
    return true
  end,
})
