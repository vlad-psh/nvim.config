---------------------------------------
-- GENERAL REMAPS
---------------------------------------
vim.keymap.set("i", "<Esc>", function()
  -- Use kbswitch tool https://github.com/1dancook/kbswitch
  vim.cmd("silent !kbswitch com.apple.keylayout.ABC &")
  return "<Esc>"
end, { expr = true, noremap = true })
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true })
vim.keymap.set("", "<C-j>", "<Enter>", { noremap = true })
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })

vim.g.mapleader = " "
-- <leader>/ - fzf/telescope Search
-- <leader>g - Git actions (stage, reset, etc)
-- <leader>h - display some info (presumably in Hover window)
-- <leader>l - LSP actions

---------------------------------------
-- TEXT MANIPULATION
---------------------------------------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move one line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move one line up" })

vim.keymap.set("n", "<leader>d", [["_d]], { desc = "Delete without yanking" })
-- Replace exact match of current word (under cursor) with...
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

---------------------------------------
-- COPY AND PASTE
---------------------------------------
-- 'x' stands for 'visual' and 'select' mode (:help mapmode-x)
vim.keymap.set({"n", "x"}, "p", "P", { desc = "Paste (before cursor)" })
-- copy to OS clipboard
vim.keymap.set({"n", "x"}, "<leader>y", [["+y]], { desc = "Copy selection to OS clipboard" })
vim.keymap.set({"n", "x"}, "<leader>Y", [["+Y]], { desc = "Copy line to OS clipboard" })
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

vim.keymap.set("n", "[t", function() vim.cmd("tabprevious") end, { desc = "Previous tab" })
vim.keymap.set("n", "]t", function() vim.cmd("tabnext") end, { desc = "Next tab" })

-- PgUp/PgDn centers cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search result is always in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

---------------------------------------
-- UI NAVIGATION
---------------------------------------
-- Quickfix window
vim.keymap.set("n", "<C-c>", function() vim.cmd("cnext") end, { desc = "quickfix: Next item" })
vim.keymap.set("n", "<C-S-c>", function() vim.cmd("cprev") end, { desc = "quickfix: Previous item" })
vim.keymap.set("n", "<leader>cn", function() vim.cmd("cnext") end, { desc = "quickfix: Next item" })
vim.keymap.set("n", "<leader>cp", function() vim.cmd("cprev") end, { desc = "quickfix: Previous item" })
vim.keymap.set("n", "<leader>cx", function() vim.cmd("cclose") end, { desc = "quickfix: Close" })
-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })
-- Window resizing
vim.keymap.set("n", "<C-w>z", function() vim.cmd("only") end, { desc = "Maximize window" })
-- When create new split, focus on it
vim.keymap.set("n", "<C-w>v", "<C-w>v<C-w>l", { desc = "Vertical split (focus right)" })
vim.keymap.set("n", "<C-w>s", "<C-w>s<C-w>j", { desc = "Horizontal split (focus bottom)" })
-- netrw-explore
vim.keymap.set("n", "<leader>e", function() vim.cmd("Explore") end, { desc = "Open netrw-explore" })

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source current file" })

---------------------------------------
-- OTHER
---------------------------------------
vim.keymap.set("n", "<leader>r", function() vim.cmd("CellularAutomaton make_it_rain") end, { desc = "Make it rain!" })
