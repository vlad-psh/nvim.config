-- nightfox styles: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
require('nightfox').setup({
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
