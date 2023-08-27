-- The default plugin directory will be as follows:
--   - Vim (Linux/macOS): '~/.vim/plugged'
--   - Vim (Windows): '~/vimfiles/plugged'
--   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
-- You can specify a custom plugin directory by passing it as the argument
--   - e.g. `call plug#begin('~/.vim/plugged')`
--   - Avoid using standard Vim directory names like 'plugin'

local Plug = vim.fn['plug#']

-- Using vim-plug with lua may require to alter syntax a little bit.
-- @see https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
vim.call('plug#begin')

-------------------------------------------------
-- Extensions
-------------------------------------------------

Plug 'nvim-lua/plenary.nvim' -- harpoon/telescope dependency
Plug 'ThePrimeagen/harpoon'
Plug('nvim-telescope/telescope.nvim', { branch = 'master' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('nvim-telescope/telescope-file-browser.nvim')

Plug 'phaazon/hop.nvim'

Plug 'mbbill/undotree'
Plug 'folke/which-key.nvim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' -- commenting support for files with multiple languages (vue, etc)
Plug 'tpope/vim-dispatch'

-------------------------------------------------
-- GIT integration
-------------------------------------------------

Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' -- GitHub support for fugitive

-------------------------------------------------
-- LSP Support
-------------------------------------------------

Plug 'neovim/nvim-lspconfig'

-- mason is optional
Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
Plug 'williamboman/mason-lspconfig.nvim'

-- Autocompletion (all required)
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v2.x' })

-------------------------------------------------
-- Look-n-feel
-------------------------------------------------

-- Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'kyazdani42/nvim-tree.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'slim-template/vim-slim'
Plug 'nvim-lualine/lualine.nvim'

-------------------------------------------------
-- THEMES
-------------------------------------------------

-- Themes switcher
Plug 'zaldih/themery.nvim'

-- https://github.com/Alexis12119/nightly.nvim
Plug 'Alexis12119/nightly.nvim'
-- https://github.com/TheNiteCoder/mountaineer.vim
Plug 'TheNiteCoder/mountaineer.vim'
-- https://github.com/EdenEast/nightfox.nvim
Plug 'EdenEast/nightfox.nvim'
-- https://github.com/mcchrish/zenbones.nvim
Plug 'mcchrish/zenbones.nvim'
-- https://github.com/arzg/vim-colors-xcode
Plug 'arzg/vim-colors-xcode'

-------------------------------------------------
-- FUN
-------------------------------------------------

Plug 'ThePrimeagen/vim-be-good'
Plug 'eandrju/cellular-automaton.nvim' -- eg: :CellularAutomaton make_it_rain

-- Initialize plugin system
-- - Automatically executes `filetype plugin indent on` and `syntax enable`.
vim.call('plug#end')

vim.cmd('filetype indent off')
