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
-- Move lines up and down (COLEMAK adapted)
vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv", { desc = "Move one line down" })
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv", { desc = "Move one line up" })

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
-- copy to OS clipboard (COLEMAK adapted)
vim.keymap.set({"n", "x"}, "<C-y>", [["+y]], { desc = "Copy selection to OS clipboard" })
vim.keymap.set({"n", "x"}, "<C-S-Y>", [["+Y]], { desc = "Copy line to OS clipboard" })
vim.keymap.set({"n", "x"}, "<C-p>", [["+P]], { desc = "Paste from OS clipboard" })

-- Terminal mode remaps (fzf, etc?)
-- For more remaps for terminal, see: :help terminal-input
vim.keymap.set("t", "<C-r>", function()
  return '<C-\\><C-N>"' .. vim.fn.nr2char(vim.fn.getchar()) .. 'pi'
end, { noremap = true, expr = true, desc = "Paste from given register, eg: <C-r>+" })
vim.keymap.set("t", "<C-p>", '<C-\\><C-N>pi', { noremap = true, desc = "Paste from current register" })

-- Yank current buffer info
vim.keymap.set({"n", "x"}, "<leader>yn", function() vim.cmd([[let @" = expand("%:t")]]) end, { desc = "Yank current file name" })
vim.keymap.set({"n", "x"}, "<leader>yp", function() vim.cmd([[let @" = expand("%")]]) end, { desc = "Yank current file relative path" })
vim.keymap.set({"n", "x"}, "<leader>yP", function() vim.cmd([[let @" = expand("%:p")]]) end, { desc = "Yank current file absolute path" })

---------------------------------------
-- TEXT NAVIGATION
---------------------------------------

-- When leaving insert mode, do not move the cursor one character forward
vim.cmd("autocmd! InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])")

-- Search result is always in the center of the screen (COLEMAK adapted)
vim.keymap.set("n", "k", "nzzzv")
vim.keymap.set("n", "K", "Nzzzv")

---------------------------------------
-- UI NAVIGATION
---------------------------------------
-- Quickfix window
vim.keymap.set("n", "<C-w>c", vim.cmd.cclose, { desc = "quickfix: Close" })
-- Window navigation (COLEMAK adapted)
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
-- vim.keymap.set("n", "<C-n>", "<C-w>j", { desc = "Go to the bottom window" })
-- vim.keymap.set("n", "<C-e>", "<C-w>k", { desc = "Go to the upper window" })
-- vim.keymap.set("n", "<C-i>", "<C-w>l", { desc = "Go to the right window" })
vim.keymap.set("n", "gh", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "gn", "<C-w>j", { desc = "Go to the bottom window" }) -- Overrides 'Search forward and select'
vim.keymap.set("n", "ge", "<C-w>k", { desc = "Go to the upper window" }) -- Overrides 'Previous end of word'
vim.keymap.set("n", "gi", "<C-w>l", { desc = "Go to the right window" }) -- Overrides 'Move to the last insertion and INSERT'

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
vim.keymap.set({"n", "x", "o"}, "u", "",  { noremap = true })

vim.keymap.set({"n", "x", "o"}, "h", "<left>",  { noremap = true })
vim.keymap.set({"n", "x", "o"}, "n", "<down>",  { noremap = true })
vim.keymap.set({"n", "x", "o"}, "e", "<up>",    { noremap = true })
vim.keymap.set({"n", "x", "o"}, "i", "<right>", { noremap = true })

-- PgUp/PgDn centers cursor
vim.keymap.set("n", "E", "<C-u>zz")
vim.keymap.set("n", "N", "<C-d>zz")

-- Reproduce lost 'i' key, sacrificed for the 'right' movement
-- 'u' in COLEMAK is on the same place as 'i' in QWERTY
vim.keymap.set("n", "u", "i", { desc = "Insert mode (before cursor)", noremap = true })
vim.keymap.set("n", "U", "I", { desc = "Append to the end of the line", noremap = true })
-- Inner text objects. E.g. dip (delete inner paragraph) is now dup
vim.keymap.set({"x", "o"}, "u", "i", { desc = "Inner text object", noremap = true })
vim.cmd("autocmd! BufRead * xnoremap <buffer> <nowait> i <right>")
vim.keymap.set("n", "vi", "v<right>")

vim.keymap.set({"n", "x"}, "<C-;>", "J", { desc = "Join lines", noremap = true })

vim.keymap.set({"n", "x"}, "k", "n", { desc = "Next search result", noremap = true })
vim.keymap.set({"n", "x"}, "K", "N", { desc = "Previous search result", noremap = true })

-------------------------------------------
-- ,/. = prev/next
vim.keymap.set("n", ",", "[")
vim.keymap.set("n", ".", "]")
-- Undo/Redo
vim.keymap.set("n", ",z", "u", { desc = "Undo", noremap = true })
vim.keymap.set("n", ".z", "<C-r>", { desc = "Redo", noremap = true })
-- Tabs
vim.keymap.set("n", ",t", vim.cmd.tabprevious, { desc = "Previous tab" })
vim.keymap.set("n", ".t", vim.cmd.tabnext, { desc = "Next tab" })
-- Jumplist
vim.keymap.set("n", ",p", "<C-o>", { desc = "Previous cursor position", noremap = true })
vim.keymap.set("n", ".p", "<C-i>", { desc = "Next cursor position", noremap = true })
-- Quickfix list
vim.keymap.set("n", ",q", vim.cmd.cprev, { desc = "quickfix: Previous item" })
vim.keymap.set("n", ".q", vim.cmd.cnext, { desc = "quickfix: Next item" })
-- TODO: Add lost mappings:
vim.keymap.set("n", "H", ",", { desc = "Repeat last movement reversed", noremap = true })
vim.keymap.set("n", "I", ";", { desc = "Repeat last movement", noremap = true })
vim.keymap.set("n", "=", ".", { desc = "Repeat last command", noremap = true })
vim.keymap.set("n", "<leader>xf", "=", { desc = "Auto format", noremap = true })
