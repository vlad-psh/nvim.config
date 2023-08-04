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

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim' -- harpoon/telescope dependency
Plug 'ThePrimeagen/harpoon'
Plug('nvim-telescope/telescope.nvim', { branch = 'master' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

Plug 'phaazon/hop.nvim'

Plug 'mbbill/undotree'
Plug 'folke/which-key.nvim'
Plug 'ThePrimeagen/vim-be-good'

Plug 'github/copilot.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' -- commenting support for files with multiple languages (vue, etc)

-------------------------------------------------
-- GIT integration
-------------------------------------------------

Plug 'lewis6991/gitsigns.nvim'

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
Plug 'slim-template/vim-slim'

-------------------------------------------------
-- THEMES
-------------------------------------------------

-- https://github.com/Alexis12119/nightly.nvim
Plug 'Alexis12119/nightly.nvim'
-- https://github.com/TheNiteCoder/mountaineer.vim
Plug 'TheNiteCoder/mountaineer.vim'
-- https://github.com/wimstefan/Lightning
Plug 'wimstefan/Lightning'
-- https://github.com/sonph/onehalf
Plug('sonph/onehalf', { ['rtp'] = 'vim' })
-- https://github.com/NLKNguyen/papercolor-theme
-- Has two styles, change it with:
-- set background=dark|light
Plug 'NLKNguyen/papercolor-theme'
-- https://github.com/navarasu/onedark.nvim
-- Atom colors. To change the style, use:
-- let g:onedark_config = { 'style': 'dark|darker|warm|warmer|cool|deep|light' }
Plug 'navarasu/onedark.nvim'
-- https://github.com/ellisonleao/gruvbox.nvim
Plug 'ellisonleao/gruvbox.nvim'
-- https://github.com/EdenEast/nightfox.nvim
Plug 'EdenEast/nightfox.nvim'

-- Initialize plugin system
-- - Automatically executes `filetype plugin indent on` and `syntax enable`.
vim.call('plug#end')

