local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  -- File explorer
  { "nvim-tree/nvim-web-devicons", lazy = true }, -- 新增这一行
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        -- 可选：确保图标启用
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
            }
          }
        }
      })
    end,
  },
  { "nvim-telescope/telescope.nvim", tag = '0.1.x', dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } },
    -- 代码补全
  { "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "L3MON4D3/LuaSnip",
  }},
  -- 代码调试
  { 'mfussenegger/nvim-dap' },
  { 'mfussenegger/nvim-dap-python' },
  { 'neovim/nvim-lspconfig' },
   -- 自动配对
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
})