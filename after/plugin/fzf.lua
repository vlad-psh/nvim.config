-- Ignore file names when searching with ripgrep
-- https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
vim.cmd('command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), fzf#vim#with_preview({\'options\': \'--delimiter : --nth 4..\'}), <bang>0)')

vim.keymap.set('n', '<C-f>', function() vim.cmd("Files") end, { desc = 'Find files' })
vim.keymap.set('n', '<C-S-f>', function() vim.fn['fzf#vim#files']('app') end, { desc = 'Find files in ./app' })
vim.keymap.set('n', '<C-/>', function() vim.cmd("Rg") end, { desc = 'Grep string (fzf)' })
vim.keymap.set('n', '<C-?>', function() vim.cmd("RG") end, { desc = 'Grep string (ripgrep)' })
vim.keymap.set('n', '<leader>sb', function() vim.cmd("Buffers") end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>sh', function() vim.cmd("Helptags") end, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>st', function() vim.cmd("Filetypes") end, { desc = 'File types' })
vim.keymap.set('n', '<leader>sv', function() vim.cmd("Colors") end, { desc = 'Colorschemes' })
