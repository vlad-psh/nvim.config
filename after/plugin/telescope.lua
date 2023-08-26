local actions = require "telescope.actions"
local p_window = require "telescope.pickers.window"
local layout_strategies = require('telescope.pickers.layout_strategies')

layout_strategies.wide_layout = function(self, max_columns, max_lines, layout_config)
  local initial_options = p_window.get_initial_window_options(self)
  local results = initial_options.results
  local prompt = initial_options.prompt
  local preview = initial_options.preview

  local xpadding = 2
  local single_column = max_columns < 140 and true or false
  local height = math.min(max_lines - 2, 35)
  local width = max_columns - 2 - xpadding * 2

  prompt.height = 1
  prompt.line = (max_lines - height) / 2 + 2
  results.line = prompt.line + 2
  prompt.col = 2 + xpadding
  results.col = prompt.col

  prompt.border = { 1, 1, 0, 1 }

  if not self.previewer then
    results.height = height

    prompt.width = math.min(width, 70)
    results.width = prompt.width

    prompt.col = math.max(2 + xpadding, math.floor((max_columns - prompt.width) / 2))
    results.col = prompt.col

    prompt.borderchars =  { "═", "║", " ", "║", "╔", "╗", " ", " " }
    results.borderchars = { "═", "║", "═", "║", "╠", "╣", "╝", "╚" }
  elseif single_column then
    results.height = math.floor(height * 0.6)
    preview.height = height - (results.height + 4)

    prompt.width = width
    results.width = prompt.width
    preview.width = prompt.width

    preview.line = prompt.line + results.height + 3
    preview.col = prompt.col

    results.border = { 1, 1, 0, 1 }
    prompt.borderchars =  { "═", "║", " ", "║", "╔", "╗", " ", " " }
    results.borderchars = { "═", "║", "═", "║", "╠", "╣", "╣", "╠" }
    preview.borderchars = { "═", "║", "═", "║", "╠", "╣", "╝", "╚" }
  else
    results.height = height - 3
    preview.height = height - 1

    prompt.width = math.min(math.floor(max_columns * 1.4), 60) - xpadding
    results.width = prompt.width
    preview.width = max_columns - prompt.width - 3 - xpadding * 2

    preview.line = prompt.line
    preview.col = prompt.width + 3 + xpadding

    preview.border = { 1, 1, 1, 0 }
    prompt.borderchars =  { "═", "║", " ", "║", "╔", "╦", " ", " " }
    results.borderchars = { "═", "║", "═", "║", "╠", "╣", "╩", "╚" }
    preview.borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" }
  end

  return {
    preview = self.previewer and preview.width > 0 and preview,
    prompt = prompt,
    results = results,
  }
end

require('telescope').setup{
  defaults = {
    sorting_strategy = 'ascending',
    results_title = false,
    border = true,
    layout_strategy = "wide_layout",
    path_display = "smart", -- slowest
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_worse,
        ["<C-k>"] = actions.move_selection_better,
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

-- Using fzf for the most of the things
vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = 'Find git ls-files' })
vim.keymap.set('n', '<C-b>', builtin.git_branches, { desc = 'Git branches' })
-- <leader>v stands for "vim info"
vim.keymap.set('n', '<leader>vc', builtin.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>vy', builtin.registers, { desc = 'List registers' })
vim.keymap.set('n', '<leader>vb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>vt', builtin.filetypes, { desc = 'File types' })
-- vim.keymap.set('n', '<leader>fic', builtin.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<C-g>', builtin.git_status, { desc = 'Git status/stage' })
