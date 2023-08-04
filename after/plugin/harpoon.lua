local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-y><C-h>", mark.add_file)

vim.keymap.set("n", "<C-y><C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-y><C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-y><C-l>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-y><C-;>", function() ui.nav_file(4) end)

vim.keymap.set("n", "<C-S-y><C-S-j>", function() ui.nav_file(5) end)
vim.keymap.set("n", "<C-S-y><C-S-k>", function() ui.nav_file(6) end)
vim.keymap.set("n", "<C-S-y><C-S-l>", function() ui.nav_file(7) end)
vim.keymap.set("n", "<C-S-y><C-S-;>", function() ui.nav_file(8) end)
