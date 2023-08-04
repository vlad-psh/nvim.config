local builtin = require('telescope.builtin')

-- For fzf configuration options see:
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
require('telescope').load_extension('fzf')

-- Using fzf for the most of the things, so those are disabled here

-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
-- vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Grep string' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'List buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find vim help' })

vim.keymap.set('n', '<leader>fc', builtin.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>fy', builtin.registers, { desc = 'List registers' })

-- vim.keymap.set('n', '<leader>fif', builtin.git_files, { desc = 'Find git ls-files' })
-- vim.keymap.set('n', '<leader>fib', builtin.git_branches, { desc = 'Git branches' })
-- vim.keymap.set('n', '<leader>fic', builtin.git_commits, { desc = 'Git commits' })
-- vim.keymap.set('n', '<leader>fis', builtin.git_status, { desc = 'Git status/stage' })
