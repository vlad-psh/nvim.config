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
        -- ["<C-e>"] = actions.move_selection_worse,
        -- ["<C-u>"] = actions.move_selection_better,
        -- ["<C-S-e>"] = actions.results_scrolling_down,
        -- ["<C-S-u>"] = actions.results_scrolling_up,
        ["<S-up>"] = actions.preview_scrolling_up,
        ["<S-down>"] = actions.preview_scrolling_down,
        ["<S-left>"] = actions.preview_scrolling_left,
        ["<S-right>"] = actions.preview_scrolling_right,
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
          ["<bs>"] = false, -- Unmap Backspace (<bs> is case-sensitive)
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

---------------------------
-- File finders
---------------------------
-- /f - Search with modified settings (eg: app directory only)
-- /F - Search with default settings (eg: all directories)
-- ?f - Command prompt to search with custom settings
vim.keymap.set('n', '/f', function()
  builtin.git_files({
    show_untracked = true,
    path_display = { truncate = 1 },
    layout_config = { force_single_column = true },
  })
end, { desc = 'Find git ls-files' })
vim.keymap.set('n', '/F', builtin.git_files, { desc = 'Find files (default)' })
vim.keymap.set('n', '?f', ':Telescope find_files cwd=app', { desc = 'Find files...' })

-- GREP
vim.keymap.set('n', '/g', function()
  builtin.live_grep({
    disable_coordinates = true,
    path_display = { truncate = 1 },
    layout_config = { force_single_column = true },
    glob_pattern = "!{.git,spec,spec/vcr_cassettes}/",
  })
end, { desc = 'Live grep' })
vim.keymap.set('n', '/G', builtin.live_grep, { desc = 'Live grep (default)' })
vim.keymap.set('n', '?g', ':Telescope live_grep cwd=app', { desc = 'Live grep...' })

---------------------------
-- References
---------------------------
vim.keymap.set('n', '/m', builtin.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '/h', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set('n', '/t', builtin.filetypes, { desc = 'File types' })
vim.keymap.set('n', '/y', builtin.registers, { desc = 'List registers' })
vim.keymap.set('n', '/u', builtin.buffers, { desc = 'Buffers' })

---------------------------
-- GIT pickers
---------------------------
vim.keymap.set('n', '/s', builtin.git_status, { desc = 'Git status/stage' })
vim.keymap.set('n', '/c', builtin.git_bcommits, { desc = 'Git commits for current buffer' })
-- vim.keymap.set('n', '<leader>fic', builtin.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '/b', function()
  builtin.git_branches({
    default_text = "!origin "
  })
end, { desc = 'Git branches' })

---------------------------
-- File browser
---------------------------
vim.keymap.set('n', '-', function()
  file_browser({
    path = "%:p:h",
    select_buffer = true,
    layout_config = { max_results_width = 75 },
  })
end, { desc = 'File browser' })
