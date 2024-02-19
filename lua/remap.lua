---------------------------------------
-- GENERAL REMAPS
---------------------------------------
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true })
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })

vim.g.mapleader = " "
-- <leader>g - Git actions (stage, reset, etc)
-- <leader>h - display some info (presumably in Hover window)
-- <leader>l - LSP actions

---------------------------------------
-- TEXT MANIPULATION
---------------------------------------
-- Move lines up and down (COLEMAK adapted)
vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv", { desc = "Move one line down" })
vim.keymap.set("v", "U", ":m '<-2<CR>gv=gv", { desc = "Move one line up" })

vim.keymap.set("n", "D", [["_d]], { desc = "Delete without yanking" })
vim.keymap.set("n", "<C-d>", "D", { desc = "Delete to the end of the line", noremap = true })
-- Replace exact match of current word (under cursor) with...
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Keep visual selection after indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
---------------------------------------
-- COPY AND PASTE
---------------------------------------
-- 'x' stands for 'visual' and 'select' mode (:help mapmode-x)
-- copy to OS clipboard (COLEMAK adapted)
vim.keymap.set({"n", "x"}, "<leader>j", [["+y]], { desc = "Copy selection to OS clipboard" })
vim.keymap.set({"n", "x"}, "<leader>J", [["+Y]], { desc = "Copy line to OS clipboard" })
vim.keymap.set({"n", "x"}, "<leader>p", [["+P]], { desc = "Paste from OS clipboard" })
-- For more remaps for terminal, see: :help terminal-input
vim.keymap.set("t", "<C-r>", function()
  return '<C-\\><C-N>"' .. vim.fn.nr2char(vim.fn.getchar()) .. 'pi'
end, { noremap = true, expr = true, desc = "Paste from given register, eg: <C-r>+" })
vim.keymap.set("t", "<C-p>", '<C-\\><C-N>pi', { noremap = true, desc = "Paste from current register" })

---------------------------------------
-- TEXT NAVIGATION
---------------------------------------

-- BUG: when this config is reloaded multiple times, each reload will add an
-- additional autocommand, which will add additional shift to the cursor
vim.cmd("au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])")

-- Search result is always in the center of the screen (COLEMAK adapted)
vim.keymap.set("n", "k", "nzzzv")
vim.keymap.set("n", "K", "Nzzzv")

---------------------------------------
-- UI NAVIGATION
---------------------------------------
-- Quickfix window
vim.keymap.set("n", "<C-c>", vim.cmd.cnext, { desc = "quickfix: Next item" })
vim.keymap.set("n", "<C-S-c>", vim.cmd.cprev, { desc = "quickfix: Previous item" })
vim.keymap.set("n", "<C-w>c", vim.cmd.cclose, { desc = "quickfix: Close" })
-- Window navigation (COLEMAK adapted)
vim.keymap.set("n", "<C-n>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-e>", "<C-w>j", { desc = "Go to the bottom window" })
vim.keymap.set("n", "<C-u>", "<C-w>k", { desc = "Go to the upper window" })
vim.keymap.set("n", "<C-i>", "<C-w>l", { desc = "Go to the right window" })
-- When create new split, focus on it
-- FIX OR REMOVE
-- vim.keymap.set("n", "<C-w>v", "<C-w>v<C-w>l", { desc = "Vertical split (focus right)" })
-- vim.keymap.set("n", "<C-w>s", "<C-w>s<C-w>j", { desc = "Horizontal split (focus bottom)" })

---------------------------------------
-- OTHER
---------------------------------------
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source current file" })
-- vim.keymap.set("n", "<C-m>", "@@", { desc = "Repeat last macro" })
vim.keymap.set("n", "<leader>r", function() vim.cmd("CellularAutomaton make_it_rain") end, { desc = "Make it rain!" })
vim.keymap.set("n", "<leader>c", function() vim.cmd("Themery") end, { desc = "Themery / Switch colorscheme" })

---------------------------------------
-- COLEMAK
---------------------------------------
-- Similar to WASD arrow keys
vim.keymap.set({"n", "x"}, "u", "k", { desc = "Move up", noremap = true })
vim.keymap.set({"n", "x"}, "n", "h", { desc = "Move left", noremap = true })
vim.keymap.set({"n", "x"}, "e", "j", { desc = "Move down", noremap = true })
vim.keymap.set({"n", "x"}, "i", "l", { desc = "Move right", noremap = true })

-- PgUp/PgDn centers cursor
vim.keymap.set("n", "U", "<C-u>zz")
vim.keymap.set("n", "E", "<C-d>zz")
-- vim.keymap.set("n", "U", "w", { desc = "", noremap = true })
-- vim.keymap.set("n", "N", "w", { desc = "", noremap = true })
-- vim.keymap.set("n", "E", "w", { desc = "", noremap = true })
-- vim.keymap.set("n", "I", "w", { desc = "", noremap = true })

-- Now we lost the following keys, so we need to remap them:
--   'n' (next search result) -> 'h'
--   'e' (move to the end of next word) - usually I prefer to use 'w' instead
--   'u' (undo; page up; etc) -> 'z'
--   'i' (insert mode; etc)   -> 'k'
-- We also have 'hjkl' keys free, so we can use them

vim.keymap.set("n", "h", "i", { desc = "Insert mode (before cursor)", noremap = true })
vim.keymap.set("n", "H", "I", { desc = "Append to the end of the line", noremap = true })

-- 'j' is the same position as 'y' in QWERTY, which is great
vim.keymap.set({"n", "x"}, "j", "y", { desc = "Yank", noremap = true })
vim.keymap.set({"n", "x"}, "J", "Y", { desc = "Yank", noremap = true })

vim.keymap.set("n", "k", "n", { desc = "Next search result", noremap = true })
vim.keymap.set("n", "K", "N", { desc = "Previous search result", noremap = true })

vim.keymap.set("n", "L", "u", { desc = "Undo", noremap = true })
vim.keymap.set("n", "Y", "<C-r>", { desc = "Redo", noremap = true })
vim.keymap.set("n", "l", "[")
vim.keymap.set("n", "y", "]")
vim.keymap.set("n", "lt", vim.cmd.tabprevious, { desc = "Previous tab" })
vim.keymap.set("n", "yt", vim.cmd.tabnext, { desc = "Next tab" })

-- vim.keymap.set("n", "j", "z", { noremap = true })
-- Now we lost the following keys, so we need to remap them too:
--   'x' (delete current character; etc)
