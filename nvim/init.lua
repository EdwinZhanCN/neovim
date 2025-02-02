-- 设置 leader 键为 space
vim.g.mapleader = " "

-- 加载插件配置
require("plugins")

-- 基本配置
vim.opt.number = true -- 显示行号
vim.opt.relativenumber = true -- 显示相对行号
vim.opt.tabstop = 4 -- tab 宽度
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- 使用空格代替 tab
vim.opt.smartindent = true -- 智能缩进
vim.opt.wrap = false -- 禁止自动换行
vim.opt.scrolloff = 8 -- 上下保留8行
vim.opt.sidescrolloff = 8 -- 左右保留8列
vim.opt.signcolumn = "yes"  -- 显示符号列
vim.opt.cursorline = true -- 高亮光标行
vim.opt.termguicolors = true -- 启用终端颜色支持
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- 系统剪贴板

-- 设置主题
vim.cmd [[colorscheme tokyonight-night]]

-- 自动补全后，自动关闭补全窗口
vim.opt.completeopt = { "menuone", "noselect" }

-- 设置快捷键
vim.keymap.set("n", "<leader>w", ":w<CR>")         -- 保存文件
vim.keymap.set("n", "<leader>q", ":q<CR>")         -- 关闭文件
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")        -- 关闭所有文件
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- 打开/关闭文件树
vim.keymap.set("n", "<leader>n", ":enew<CR>")       -- 新建文件
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") --查找文件
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") -- 查找字符串

-- LSP 配置
local lsp = require("lspconfig")

-- 配置 clangd
lsp.clangd.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = 'Go to definition' })
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true, desc = 'Go to implementation' })
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true, desc = 'Go to references' })
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true, desc = 'Rename symbol' })
        buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true, desc = 'Code action' })
        buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { noremap = true, silent = true, desc = 'Format document' })
    end,
}
-- 配置 pyright
lsp.pyright.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = 'Go to definition' })
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true, desc = 'Go to implementation' })
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true, desc = 'Go to references' })
      buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true, desc = 'Rename symbol' })
      buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true, desc = 'Code action' })
      buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { noremap = true, silent = true, desc = 'Format document' })
  end,
}

-- 代码补全
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }),
})

-- 设置调试器
local dap = require('dap')
dap.configurations.cpp = {
  {
    name = 'Launch File',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    -- lldb_args = {'-o', 'settings set stop-on-sharedlibrary-events true'},
  },
}

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>dv", dap.step_over)
vim.keymap.set("n", "<leader>dl", dap.run_last)