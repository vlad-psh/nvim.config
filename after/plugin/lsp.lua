local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'solargraph',
  -- 'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, remap = false, desc = desc }
  end

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts('Go to definition'))
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts('Show hover'))
  vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, opts('List all workspace symbols'))
  vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts('Open diagnostics'))
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts('Go to previous diagnostic'))
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts('Go to next diagnostic'))
  vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts('Select a code action'))
  vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts('List all references'))
  vim.keymap.set("n", "<leader>lm", function() vim.lsp.buf.rename() end, opts('Rename all references'))
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts('Show signature help'))
  -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
end)

lsp.setup()

-- vim.diagnostic.config({
--     virtual_text = true
-- })

vim.diagnostic.config({
  virtual_text = true
})

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
