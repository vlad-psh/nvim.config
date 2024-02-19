local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")
local file_browser = require("telescope").extensions.file_browser.file_browser
require("telescope_habahiro")

require('telescope').setup{
  defaults = {
    sorting_strategy = 'ascending',
    results_title = false,
    winblend = 10,
    border = true,
    scroll_strategy = "limit",
    layout_strategy = "habahiro",
    path_display = { truncate = 1 },
    mappings = {
      i = {
        -- COLEMAK adapted
        ["<C-e>"] = actions.move_selection_worse,
        ["<C-u>"] = actions.move_selection_better,
        -- ["<C-S-e>"] = actions.results_scrolling_down,
        -- ["<C-S-u>"] = actions.results_scrolling_up,
        ["<C-S-u>"] = actions.preview_scrolling_up,
        ["<C-S-e>"] = actions.preview_scrolling_down,
        ["<C-S-n>"] = actions.preview_scrolling_left,
        ["<C-S-i>"] = actions.preview_scrolling_right,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-S-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close, -- Disable "normal" mode while in Telescope
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden"
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
      dir_icon = "⛶" ,
      hide_parent_dir = true,
      grouped = true, -- List directories on the top
      -- respect_gitignore = true,
      mappings = {
        i = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
          ["<C-c>"] = function() vim.cmd("stopinsert") end,
          ["<C-t>"] = actions.select_tab,
          ["<C-z>"] = fb_actions.goto_cwd,
          ["-"] = fb_actions.goto_parent_dir,
        },
        n = {
          ["-"] = fb_actions.goto_parent_dir,
        },
      },
    },
  },
  pickers = {
    git_branches = {
      mappings = {
        i = { ["<cr>"] = actions.git_switch_branch },
      },
    },
  },
}

-- For fzf configuration options see:
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

vim.keymap.set('n', '<C-f>', function()
  builtin.git_files({
    show_untracked = true,
    path_display = { truncate = 1 },
    layout_config = { force_single_column = true },
  })
end, { desc = 'Find git ls-files' })
vim.keymap.set('n', '-', function()
  file_browser({
    path = "%:p:h",
    select_buffer = true,
    layout_config = { max_results_width = 75 },
  })
end, { desc = 'File browser' })
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
    glob_pattern = "!{.git,spec,spec/vcr_cassettes}/",
  })
end, { desc = 'Live grep' })
vim.keymap.set('n', '<C-S-f>', ':Telescope find_files cwd=app', { desc = 'Find files...' })
vim.keymap.set('n', '<C-?>', ':Telescope live_grep cwd=app', { desc = 'Live grep...' })
-- vim.keymap.set('n', '<leader>fic', builtin.git_commits, { desc = 'Git commits' })

-- <leader>v stands for "vim info"
vim.keymap.set('n', '<leader>vc', builtin.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>vy', builtin.registers, { desc = 'List registers' })
vim.keymap.set('n', '<leader>vb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>vt', builtin.filetypes, { desc = 'File types' })
