-- Lua LSP configuration for neovim Lua API
-- Should be required before LSP config itself
require("neodev").setup({})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- For the list of all available server configurations refer to the:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.solargraph.setup({ capabilities = capabilities })
lspconfig.volar.setup({
  capabilities = capabilities,
  filetypes = {'typescript', 'javascript', 'vue', 'json'}
})

-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = 'LSP: Show hover' })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'LSP: Go to definition' })
vim.keymap.set("n", "gm", vim.lsp.buf.implementation, { desc = 'LSP: Go to implementation' })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = 'LSP: Go to type_definition' })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, { desc = 'LSP: List all workspace symbols' })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = 'Open diagnostics' })
-- COLEMAK adapted
vim.keymap.set("n", "ld", vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set("n", "yd", vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = 'LSP: Select a code action' })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = 'LSP: List all references' })
vim.keymap.set("n", "<leader>lm", vim.lsp.buf.rename, { desc = 'LSP: Rename all references' })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = 'LSP: Show signature help' })
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  mapping = {
    -- COLEMAK adapted
    ['<C-e>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-u>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-S-e>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-S-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-h>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 'c' }),
    ['<C-q>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }),
})

