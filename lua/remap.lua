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
vim.keymap.set({"n", "x", "o"}, "u", "<up>",    { noremap = true })
vim.keymap.set({"n", "x", "o"}, "n", "<left>",  { noremap = true })
vim.keymap.set({"n", "x", "o"}, "e", "<down>",  { noremap = true })
vim.keymap.set({"n", "x", "o"}, "i", "<right>", { noremap = true })

-- PgUp/PgDn centers cursor
vim.keymap.set("n", "U", "<C-u>zz")
vim.keymap.set("n", "E", "<C-d>zz")

-- Reproduce lost 'i' key, sacrificed for the 'right' movement
vim.keymap.set("n", "s", "i", { desc = "Insert mode (before cursor)", noremap = true })
vim.keymap.set("n", "S", "I", { desc = "Append to the end of the line", noremap = true })
-- inneR text objects. E.g. dip (delete inner paragraph) is now drp
vim.keymap.set({"x", "o"}, "r", "i", { desc = "Inner text object", noremap = true })
vim.cmd('xnoremap <nowait> i <right>')
vim.keymap.set("n", "vi", "v<right>")

-- 'j' is the same position as 'y' in QWERTY, which is great
vim.keymap.set({"n", "x"}, "j", "y", { desc = "Yank", noremap = true })
vim.keymap.set({"n", "x"}, "J", "Y", { desc = "Yank line", noremap = true })

vim.keymap.set({"n", "x"}, "k", "n", { desc = "Next search result", noremap = true })
vim.keymap.set({"n", "x"}, "K", "N", { desc = "Previous search result", noremap = true })

-------------------------------------------
-- M <- prev || next -> Y
-- NOTE: Do not map <Ctrl+M> to avoid conflict with <Enter>
vim.keymap.set("n", "m", "[")
vim.keymap.set("n", "y", "]")
-- vim.keymap.set("n", "M", ",", { desc = "Repeat last movement reversed", noremap = true })
-- vim.keymap.set("n", "Y", ";", { desc = "Repeat last movement", noremap = true })
vim.keymap.set("n", ",", ";", { desc = "Repeat last movement", noremap = true })
-- Undo/Redo
vim.keymap.set("n", "M", "u", { desc = "Undo", noremap = true })
vim.keymap.set("n", "Y", "<C-r>", { desc = "Redo", noremap = true })
-- Tabs
vim.keymap.set("n", "mt", vim.cmd.tabprevious, { desc = "Previous tab" })
vim.keymap.set("n", "yt", vim.cmd.tabnext, { desc = "Next tab" })
-- Jumplist
vim.keymap.set("n", "mp", "<C-o>", { desc = "Previous cursor position", noremap = true })
vim.keymap.set("n", "yp", "<C-i>", { desc = "Next cursor position", noremap = true })
-- Quickfix list
vim.keymap.set("n", "yq", vim.cmd.cnext, { desc = "quickfix: Next item" })
vim.keymap.set("n", "mq", vim.cmd.cprev, { desc = "quickfix: Previous item" })
