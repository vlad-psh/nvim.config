vim.g.mapleader = " "
-- I'm trying to group my <leader> keymaps by the following rules:
--   <leader>v actions that opens a new window
--   <leader>g git actions (stage, reset, etc)
--   <leader>h git non-destructive actions (blame, display something, etc)

-- PgUp/PgDn centers cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search result is always in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy to OS clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy selection to OS clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to OS clipboard" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste from OS clipboard" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source current file" })

vim.keymap.set("n", "[t", function() vim.cmd("tabprevious") end, { desc = "Previous tab" })
vim.keymap.set("n", "]t", function() vim.cmd("tabnext") end, { desc = "Next tab" })
