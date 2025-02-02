 -- 配置 pyright 的 format
 vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
      vim.lsp.buf.format()
    end,
  })