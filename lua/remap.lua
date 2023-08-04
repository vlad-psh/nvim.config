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
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
