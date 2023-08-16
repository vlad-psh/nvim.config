vim.keymap.set('n', '<C-S-g>', function() vim.cmd("Git | resize 15") end, { desc = 'Open fugitive' })
vim.keymap.set('n', '<C-g>', function() vim.cmd("tabnew | Git | only") end, { desc = 'Open fugitive in new tab' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fugitive',
  callback = function()
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = true
      opts.remap = false
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "<leader>w", function() vim.cmd("Git pull --rebase") end, { desc = "git pull --rebase" })
    map("n", "<leader>p", function() vim.cmd("Git push --force-with-lease") end, { desc = "git push --force-with-lease" })
    map("n", "<leader>P", function() vim.cmd("Git push -u origin") end, { desc = "git push -u origin" })
  end,
})
