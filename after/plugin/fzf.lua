vim.env.FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
vim.env.FZF_DEFAULT_OPTS = '--reverse --scrollbar=░'

vim.g.fzf_layout = { window = { width = 1.0, height = 1.0, border = 'none' } }

-- Ignore file names when searching with ripgrep
-- https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
vim.cmd('command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), fzf#vim#with_preview({\'options\': \'--delimiter : --nth 4..\'}), <bang>0)')

vim.keymap.set('n', '<C-S-f>', function() vim.cmd("Files") end, { desc = 'Find files' })
-- vim.keymap.set('n', '<C-S-f>', function() vim.fn['fzf#vim#files']('app') end, { desc = 'Find files in ./app' })
vim.keymap.set('n', '<C-/>', function() vim.cmd("Rg") end, { desc = 'Grep string (fzf)' })
vim.keymap.set('n', '<C-?>', function() vim.cmd("RG") end, { desc = 'Grep string (ripgrep)' })
vim.keymap.set('n', '<leader>/f', function() vim.cmd("BCommits") end, { desc = 'Git commits for current buffer' })
