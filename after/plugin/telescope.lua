require('telescope').setup{
  defaults = {
    border = true,
    borderchars = { "─", "│", "─", " ", "─", "┬", "┴", "─" },
    layout_strategy = 'flex',
    layout_config = {
      height = 1000, -- Doesn't accepts 1.0 as 100% height
      width = 1000,
      prompt_position = 'bottom',
    },
  },
}
local builtin = require('telescope.builtin')

-- For fzf configuration options see:
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
require('telescope').load_extension('fzf')

-- Using fzf for the most of the things
vim.keymap.set('n', '<leader>/c', builtin.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>/y', builtin.registers, { desc = 'List registers' })
-- vim.keymap.set('n', '<leader>fif', builtin.git_files, { desc = 'Find git ls-files' })
vim.keymap.set('n', '<C-b>', builtin.git_branches, { desc = 'Git branches' })
-- vim.keymap.set('n', '<leader>fic', builtin.git_commits, { desc = 'Git commits' })
-- vim.keymap.set('n', '<leader>fis', builtin.git_status, { desc = 'Git status/stage' })
