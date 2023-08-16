vim.g.fzf_layout = { window = { width = 1.0, height = 1.0, border = 'none' } }

-- Ignore file names when searching with ripgrep
-- https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
vim.cmd('command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), fzf#vim#with_preview({\'options\': \'--delimiter : --nth 4..\'}), <bang>0)')

vim.keymap.set('n', '<C-f>', function() vim.cmd("Files") end, { desc = 'Find files' })
vim.keymap.set('n', '<C-S-f>', function() vim.fn['fzf#vim#files']('app') end, { desc = 'Find files in ./app' })
vim.keymap.set('n', '<C-/>', function() vim.cmd("Rg") end, { desc = 'Grep string (fzf)' })
vim.keymap.set('n', '<C-?>', function() vim.cmd("RG") end, { desc = 'Grep string (ripgrep)' })
vim.keymap.set('n', '<leader>/b', function() vim.cmd("Buffers") end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>/h', function() vim.cmd("Helptags") end, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>/t', function() vim.cmd("Filetypes") end, { desc = 'File types' })
vim.keymap.set('n', '<leader>/v', function() vim.cmd("Colors") end, { desc = 'Colorschemes' })
vim.keymap.set('n', '<leader>/f', function() vim.cmd("BCommits") end, { desc = 'Git commits for current buffer' })
