-- local customSearchColors = "vim.cmd('hi Search guibg=#ffffff guifg=black'); vim.cmd('hi CurSearch guibg=#00ff00 guifg=black')"
local customSearchColors = "vim.cmd('hi CurSearch guibg=#fe9e3b guifg=black')"

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

require('vscode').setup({
    style = 'light', -- Alternatively set style in setup
    transparent = false,
    italic_comments = true,
    italic_inlayhints = true,
    underline_links = true,
    disable_nvimtree_bg = true,
    -- terminal_colors = true,
})

vim.cmd('set guicursor=n-v-c:block-Cursor')
vim.cmd('set guicursor+=i:ver50-Cursor')

require("themery").setup({
  themes = {
    -- Favorites:
    { name = "terafox", colorscheme = "terafox" },
    { name = "mountaineer", colorscheme = "mountaineer" },
    { name = "kanagawa-dragon", colorscheme = "kanagawa-dragon", after = customSearchColors },
    { name = "dayfox", colorscheme = "dayfox", },
    -- Other:
    { name = "vscode", colorscheme = "vscode", before = "vim.opt.background = 'light'"  },
    { name = "xcode:mod", colorscheme = "xcodemod" },
    -- Some zenbones themes are not being loaded properly on startup unless we load default 'zenbones' before
    { name = "zenbones:light", colorscheme = "zenbones", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'light'" },
    { name = "zenwritten:light", colorscheme = "zenwritten", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'light'" },
    { name = "tokyobones:light", colorscheme = "tokyobones", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'light'" },
    { name = "zenwritten:dark", colorscheme = "zenwritten", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'dark'" },
    { name = "rosebones:dark", colorscheme = "rosebones", before = "vim.cmd('colorscheme zenbones'); vim.opt.background = 'dark'" },
    { name = "kanagawa-wave", colorscheme = "kanagawa-wave", after = customSearchColors },
  },
  livePreview = true,
})

-- highlight Pmenu ctermfg=white ctermbg=darkblue
-- highlight PmenuSel ctermfg=black ctermbg=yellow

-- let g:onedark_config = { 'style': 'light' }
-- set background=light
