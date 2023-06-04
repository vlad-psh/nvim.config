local builtin = require('telescope.builtin')

-- Default
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>fc', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fy', builtin.registers, {})

vim.keymap.set('n', '<leader>fif', builtin.git_files, {})
vim.keymap.set('n', '<leader>fib', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fic', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fis', builtin.git_status, {})
