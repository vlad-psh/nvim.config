require('vim-plug')
require('remap')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- Lines to always show above/below cursor
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- Folding settings
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 4
vim.opt.foldenable = false
vim.opt.foldlevel = 1

-- Changing defaults for 'Explorer' mode, etc
-- Defaults are: noma nomod nonu nowrap ro nobl
vim.g.netrw_bufsettings = 'noma nomod nu relnum nowrap ro nobl'
vim.g.netrw_preview = 1 -- Vertical split for preview
-- vim.g.netrw_winsize = 30

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "~/.local/share/nvim/undodir"
vim.opt.undofile = true

vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"

-- vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
