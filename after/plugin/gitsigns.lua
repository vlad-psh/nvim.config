require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    -- map('n', ']c', function()
    --   if vim.wo.diff then return ']c' end
    --   vim.schedule(function() gs.next_hunk() end)
    --   return '<Ignore>'
    -- end, {expr=true})

    -- map('n', '[c', function()
    --   if vim.wo.diff then return '[c' end
    --   vim.schedule(function() gs.prev_hunk() end)
    --   return '<Ignore>'
    -- end, {expr=true})

    -- Actions
    map('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
    map('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
    map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { desc = 'Stage hunk' })
    map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { desc = 'Reset hunk' })
    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })

    map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
    map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })

    -- Info
    map('n', '<leader>ib', function() gs.blame_line{full=true} end, { desc = 'Blame line' })
    map('n', '<leader>ih', gs.preview_hunk, { desc = 'Preview hunk' })
    -- UI changes
    map('n', '<leader>ub', gs.toggle_current_line_blame)
    map('n', '<leader>ud', gs.toggle_deleted, { desc = 'Toggle show deleted lines' })
    -- Movements
    map('n', 'ms', gs.prev_hunk, { desc = 'Git: Jump to previous hunk' })
    map('n', 'ys', gs.next_hunk, { desc = 'Git: Jump to next hunk' })

    -- Text object
    -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
