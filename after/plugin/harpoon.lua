local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<F10>", mark.add_file)

vim.keymap.set("n", "<F11>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<F12>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<F13>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<F14>", function() ui.nav_file(4) end)
-- F11-F14 buth with SHIFT key
vim.keymap.set("n", "<F23>", function() ui.nav_file(5) end)
vim.keymap.set("n", "<F24>", function() ui.nav_file(6) end)
vim.keymap.set("n", "<S-F13>", function() ui.nav_file(7) end)
vim.keymap.set("n", "<S-F14>", function() ui.nav_file(8) end)
