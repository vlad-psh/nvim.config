-- Lua LSP configuration for neovim Lua API
-- Should be required before LSP config itself
require("neodev").setup({})

local lspconfig = require("lspconfig")

-- For the list of all available server configurations refer to the:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
lspconfig.lua_ls.setup({})
lspconfig.tsserver.setup({})
lspconfig.solargraph.setup({})
lspconfig.volar.setup({
  filetypes = {'typescript', 'javascript', 'vue', 'json'}
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = 'LSP: Show hover' })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'LSP: Go to definition' })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = 'LSP: Go to implementation' })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = 'LSP: Go to type_definition' })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, { desc = 'LSP: List all workspace symbols' })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = 'Open diagnostics' })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = 'LSP: Select a code action' })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = 'LSP: List all references' })
vim.keymap.set("n", "<leader>lm", vim.lsp.buf.rename, { desc = 'LSP: Rename all references' })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = 'LSP: Show signature help' })
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
