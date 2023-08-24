require("themery").setup({
  themes = {
    { name = "xcode:mod", colorscheme = "xcodemod" },
    { name = "xcode:light:hc", colorscheme = "xcodelighthc" },
    -- Some zenbones themes are not being loaded properly on startup unless we load default 'zenbones' before
    { name = "zenbones:light", colorscheme = "zenbones", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'light'" },
    { name = "zenwritten:light", colorscheme = "zenwritten", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'light'" },
    { name = "tokyobones:light", colorscheme = "tokyobones", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'light'" },
    { name = "dayfox", colorscheme = "dayfox", },
    { name = "terafox", colorscheme = "terafox" },
    { name = "nightly", colorscheme = "nightly" },
    { name = "zenwritten:dark", colorscheme = "zenwritten", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'dark'" },
    { name = "rosebones:dark", colorscheme = "rosebones", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'dark'" },
    { name = "mountaineer", colorscheme = "mountaineer", },
  },
  themeConfigFile = "~/.config/nvim/after/plugin/colorschemes.lua",
  livePreview = true,
})

-- nightfox styles: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
require("nightfox").setup({
  options = {
    dim_inactive = true,
    terminal_colors = false,
  },
  specs = {
    terafox = {
      -- Swap colors so that "active" background is darker,
      -- and "inactive" is slightly brighter with lower contrast
      bg0 = "bg1",
      bg1 = "bg0",
    },
  },
  groups = {
    dayfox = {
      Cursor = { bg = "palette.white" },
    },
  },
})

require("nightly").setup({
  transparent = false,
  styles = {
    comments = { italic = true },
    functions = { italic = false },
    variables = { italic = false },
    keywords = { italic = false },
  },
  highlights = {},
})

vim.cmd('colorscheme terafox')

vim.cmd('set guicursor=n-v-c:block-Cursor')
vim.cmd('set guicursor+=i:ver50-Cursor')

-- highlight Pmenu ctermfg=white ctermbg=darkblue
-- highlight PmenuSel ctermfg=black ctermbg=yellow

-- let g:onedark_config = { 'style': 'light' }
-- set background=light

-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme xcodemod")
-- end themery block
