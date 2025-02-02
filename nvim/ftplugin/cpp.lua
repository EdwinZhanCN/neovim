 -- 配置 clangd 的 format
 vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.cpp,*.cc,*.cxx,*.c,*.h,*.hpp",
    callback = function()
        vim.lsp.buf.format()
    end,
})