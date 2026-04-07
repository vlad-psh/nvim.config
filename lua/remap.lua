---------------------------------------
-- GENERAL REMAPS
---------------------------------------
-- CTRL-combinations that may cause problems in terminal
--   <C-i> - Tab
--   <C-m> - Enter
--   <C-[> - Escape
--   <C-h> - Backspace (this one may work)

vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true })
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Stop highlighing the search results", noremap = true })

vim.g.mapleader = " "
-- <leader>i - Show floating window with some info
-- <leader>q - Show/generate quickfix list
-- <leader>x - Execute an action
-- <leader>u - UI changes (eg: show/hide deleted lines, etc)
-- / - Search utilities (telescope, etc)
vim.keymap.set({ "n", "v" }, "//", "/", { noremap = true })
vim.keymap.set({ "n", "v" }, "??", "?", { noremap = true })

vim.keymap.set({ "n", "x", "i"}, "<C-q>", "<Esc>:q<CR>", { desc = "Quit the current window" })
vim.keymap.set({ "n", "x", "i"}, "<C-s>", "<Esc>:w<CR>", { desc = "Write buffer to the current file" })

---------------------------------------
-- TEXT MANIPULATION
---------------------------------------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move one line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move one line up" })

vim.keymap.set("n", "<C-D>", [["_d]], { desc = "Delete without yanking" })
-- Replace exact match of current word (under cursor) with...
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Keep visual selection after indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
---------------------------------------
-- COPY AND PASTE
---------------------------------------
-- 'x' stands for 'visual' and 'select' mode (:help mapmode-x)
vim.keymap.set({"n", "x"}, "<leader>y", [["+y]], { desc = "Copy selection to OS clipboard" })
vim.keymap.set({"n", "x"}, "<leader>p", [["+P]], { desc = "Paste from OS clipboard" })
vim.keymap.set({"n", "x"}, "<leader>yl", [[Y]], { desc = "Yank line", noremap = true })
vim.keymap.set({"n", "x"}, "<leader>Yl", [["+Y]], { desc = "Copy line to OS clipboard" })

-- Terminal mode remaps (fzf, etc?)
-- For more remaps for terminal, see: :help terminal-input
vim.keymap.set("t", "<C-S-P>", function()
  return '<C-\\><C-N>"' .. vim.fn.nr2char(vim.fn.getchar()) .. 'pi'
end, { noremap = true, expr = true, desc = "Paste from given register, eg: <C-r>+" })
vim.keymap.set("t", "<C-p>", '<C-\\><C-N>pi', { noremap = true, desc = "Paste from current register" })

-- Yank current buffer info
vim.keymap.set({"n", "x"}, "<leader>yn", function() vim.cmd([[let @" = expand("%:t")]]) end, { desc = "Yank current file name" })
vim.keymap.set({"n", "x"}, "<leader>yp", function() vim.cmd([[let @" = expand("%")]]) end, { desc = "Yank current file relative path" })
vim.keymap.set({"n", "x"}, "<leader>yP", function() vim.cmd([[let @" = expand("%:p")]]) end, { desc = "Yank current file absolute path" })
vim.keymap.set({"n", "x"}, "<leader>Yn", function() vim.cmd([[let @+ = expand("%:t")]]) end, { desc = "Copy current file name to OS clipboard" })
vim.keymap.set({"n", "x"}, "<leader>Yp", function() vim.cmd([[let @+ = expand("%")]]) end, { desc = "Copy current file relative path to OS clipboard" })
vim.keymap.set({"n", "x"}, "<leader>YP", function() vim.cmd([[let @+ = expand("%:p")]]) end, { desc = "Copy current file absolute path to OS clipboard" })

---------------------------------------
-- TEXT NAVIGATION
---------------------------------------

-- When leaving insert mode, do not move the cursor one character forward
vim.cmd("autocmd! InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- PgUp/PgDn centers cursor
vim.keymap.set("n", "K", "<C-u>zz")
vim.keymap.set("n", "J", "<C-d>zz")
---------------------------------------
-- UI NAVIGATION
---------------------------------------
-- Quickfix window
vim.keymap.set("n", "<C-w>c", vim.cmd.cclose, { desc = "quickfix: Close" })
vim.keymap.set("n", "gh", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "gj", "<C-w>j", { desc = "Go to the bottom window" })
vim.keymap.set("n", "gk", "<C-w>k", { desc = "Go to the upper window" })
vim.keymap.set("n", "gl", "<C-w>l", { desc = "Go to the right window" })

vim.keymap.set("n", "g,", "<C-o>", { desc = "Go to [count] older cursor position in jump list" })
vim.keymap.set("n", "g.", "<C-i>", { desc = "Go to [count] newer cursor position in jump list" })

---------------------------------------
-- OTHER
---------------------------------------
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source current file" })
-- vim.keymap.set("n", "<C-m>", "@@", { desc = "Repeat last macro" })
vim.keymap.set("n", "<leader>r", function() vim.cmd("CellularAutomaton make_it_rain") end, { desc = "Make it rain!" })
vim.keymap.set("n", "<leader>c", function() vim.cmd("Themery") end, { desc = "Themery / Switch colorscheme" })

-------------------------------------------
-- ,/. = prev/next
vim.keymap.set("n", ",", "[")
vim.keymap.set("n", ".", "]")
-- Undo/Redo
vim.keymap.set("n", "(", "u", { desc = "Undo", noremap = true })
vim.keymap.set("n", ")", "<C-r>", { desc = "Redo", noremap = true })
-- Tabs
vim.keymap.set("n", ",t", vim.cmd.tabprevious, { desc = "Previous tab" })
vim.keymap.set("n", ".t", vim.cmd.tabnext, { desc = "Next tab" })
-- Jumplist
vim.keymap.set("n", ",p", "<C-o>", { desc = "Previous cursor position", noremap = true })
vim.keymap.set("n", ".p", "<C-i>", { desc = "Next cursor position", noremap = true })
-- Quickfix list
vim.keymap.set("n", ",q", vim.cmd.cprev, { desc = "quickfix: Previous item" })
vim.keymap.set("n", ".q", vim.cmd.cnext, { desc = "quickfix: Next item" })

vim.keymap.set("n", "=", ".", { desc = "Repeat last command", noremap = true })
