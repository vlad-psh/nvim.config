local actions = require("telescope.actions")
require("telescope_habahiro")

require('telescope').setup{
  defaults = {
    sorting_strategy = 'ascending',
    results_title = false,
    border = true,
    scroll_strategy = "limit",
    layout_strategy = "habahiro",
    path_display = { truncate = 1 },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_worse,
        ["<C-k>"] = actions.move_selection_better,
        ["<C-d>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.results_scrolling_up,
        ["<C-S-k>"] = actions.preview_scrolling_up,
        ["<C-S-j>"] = actions.preview_scrolling_down,
        ["<C-S-h>"] = actions.preview_scrolling_left,
        ["<C-S-l>"] = actions.preview_scrolling_right,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-S-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close, -- Disable "normal" mode while in Telescope
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
}
local builtin = require('telescope.builtin')

-- For fzf configuration options see:
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<C-f>', function()
  builtin.git_files({
    show_untracked = true
  })
end, { desc = 'Find git ls-files' })
vim.keymap.set('n', '<C-g>', builtin.git_status, { desc = 'Git status/stage' })
vim.keymap.set('n', '<C-b>', function()
  builtin.git_branches({
    default_text = "!origin "
  })
end, { desc = 'Git branches' })
vim.keymap.set('n', '<C-S-b>', builtin.git_bcommits, { desc = 'Git commits for current buffer' })
vim.keymap.set('n', '<C-/>', function()
  builtin.live_grep({
    disable_coordinates = true,
    path_display = { truncate = 1 },
    layout_config = { force_single_column = true },
  })
end, { desc = 'Live grep' })
-- vim.keymap.set('n', '<leader>fic', builtin.git_commits, { desc = 'Git commits' })

-- <leader>v stands for "vim info"
vim.keymap.set('n', '<leader>vc', builtin.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>vy', builtin.registers, { desc = 'List registers' })
vim.keymap.set('n', '<leader>vb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>vt', builtin.filetypes, { desc = 'File types' })
