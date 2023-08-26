local p_window = require "telescope.pickers.window"
local layout_strategies = require('telescope.pickers.layout_strategies')

layout_strategies.wide_layout = function(self, max_columns, max_lines, layout_config)
  local initial_options = p_window.get_initial_window_options(self)
  local results = initial_options.results
  local prompt = initial_options.prompt
  local preview = initial_options.preview

  local xpadding = 2

  if max_columns > 140 then
    local height = math.min(max_lines - 2, 35)

    -- Height
    prompt.height = 1
    results.height = height - 3
    preview.height = height - 1

    -- Width
    prompt.width = math.min(math.floor(max_columns * 1.4), 60) - xpadding
    results.width = prompt.width
    preview.width = max_columns - prompt.width - 3 - xpadding * 2

    -- Line
    prompt.line = (max_lines - height) / 2 + 2
    results.line = prompt.line + 2
    preview.line = prompt.line

    -- Col
    prompt.col = 2 + xpadding
    results.col = prompt.col
    preview.col = prompt.width + 3 + xpadding

    prompt.border = { 1, 1, 0, 1 }
    results.border = { 1, 1, 1, 1 }
    preview.border = { 1, 1, 1, 0 }

    prompt.borderchars =  { "═", "║", " ", "║", "╔", "╦", " ", " " }
    results.borderchars = { "═", "║", "═", "║", "╠", "╣", "╩", "╚" }
    preview.borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" }
  else
    local height = math.min(max_lines - 2, 35)

    -- Height
    prompt.height = 1
    results.height = math.floor(height * 0.6)
    preview.height = height - (results.height + 4)

    -- Width
    prompt.width = max_columns - 2 - xpadding * 2
    results.width = prompt.width
    preview.width = prompt.width

    -- Line
    prompt.line = (max_lines - height) / 2 + 2
    results.line = prompt.line + 2
    preview.line = prompt.line + results.height + 3

    -- Col
    prompt.col = 2 + xpadding
    results.col = prompt.col
    preview.col = prompt.col

    prompt.border = { 1, 1, 0, 1 }
    results.border = { 1, 1, 1, 1 }
    preview.border = { 1, 1, 1, 1 }

    prompt.borderchars =  { "═", "║", " ", "║", "╔", "╗", " ", " " }
    results.borderchars = { "═", "║", "═", "║", "╠", "╣", "╣", "╠" }
    preview.borderchars = { "═", "║", "═", "║", " ", " ", "╝", "╚" }
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
vim.keymap.set('n', '<leader>/c', builtin.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>/y', builtin.registers, { desc = 'List registers' })
vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = 'Find git ls-files' })
vim.keymap.set('n', '<C-b>', builtin.git_branches, { desc = 'Git branches' })
-- vim.keymap.set('n', '<leader>fic', builtin.git_commits, { desc = 'Git commits' })
-- vim.keymap.set('n', '<leader>fis', builtin.git_status, { desc = 'Git status/stage' })
