-- The default plugin directory will be as follows:
--   - Vim (Linux/macOS): '~/.vim/plugged'
--   - Vim (Windows): '~/vimfiles/plugged'
--   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
-- You can specify a custom plugin directory by passing it as the argument
--   - e.g. `call plug#begin('~/.vim/plugged')`
--   - Avoid using standard Vim directory names like 'plugin'

local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- @see https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom

-- Extensions
Plug 'nvim-lua/plenary.nvim' -- telescope dependency
Plug('nvim-telescope/telescope.nvim', { tag = '*' })
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good'

Plug 'github/copilot.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' -- commenting support for files with multiple languages (vue, etc)

-- GIT integration
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

-- LSP Support (mason is optional)
Plug 'neovim/nvim-lspconfig'
Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
Plug 'williamboman/mason-lspconfig.nvim'
-- Autocompletion (all required)
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
-- LSP
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v2.x' })

-- Look-n-feel
-- Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'kyazdani42/nvim-tree.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'slim-template/vim-slim'
-- Themes
Plug 'Alexis12119/nightly.nvim'
Plug 'TheNiteCoder/mountaineer.vim'
-- Plug 'challenger-deep-theme/vim' -- removed
Plug 'wimstefan/Lightning'
Plug 'andreasvc/vim-256noir'

-- Initialize plugin system
-- - Automatically executes `filetype plugin indent on` and `syntax enable`.
vim.call('plug#end')

