vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = { ['*'] = false }

vim.keymap.set('i', '<C-o>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.keymap.set('i', '<C-h>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-i>', '<Plug>(copilot-next)')

vim.keymap.set('i', '<C-z>', '<Plug>(copilot-suggest)')
vim.keymap.set('i', '<C-S-z>', '<Plug>(copilot-dismiss)')

-- vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
-- vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-line)')
