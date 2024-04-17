vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = { trail = '·', nbsp = '␣', tab = '» ' }
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

vim.opt.swapfile = false
vim.opt.backup = false
vim.cmd("set undodir=~/.local/share/nvim/undodir")
vim.opt.undofile = true

vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"

-- vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

-- Disable default keyboard mappings of tpope/vim-dispatch
-- Should be set before loading the plugin
vim.g.dispatch_no_maps = 1
-- Do not use 'lush' for zenbones colorscheme
vim.g.bones_compat = 1

vim.cmd('filetype indent off')

require('utils')
require('vim-plug')
require('remap')
