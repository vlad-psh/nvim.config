set number
set relativenumber
set cursorline
" Lines to always show above/below cursor
set scrolloff=5

set tabstop=2
set shiftwidth=2
set expandtab 
" Folding settings
set foldmethod=indent
set foldnestmax=4
set nofoldenable
set foldlevel=1

" Changing defaults for 'Explorer' mode, etc
" Defaults are: noma nomod nonu nowrap ro nobl
let g:netrw_bufsettings = 'noma nomod nu relnum nowrap ro nobl'
let g:netrw_preview = 1 " Vertical split for preview
" let g:netrw_winsize = 30

set noswapfile 
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden

" set guicursor=""
set termguicolors

" Seems like this won't work for multichar mappings
" https://github.com/vim/vim/issues/3018#issuecomment-1206100569
set langmap="йцукенгшщз;qwertyuiop,фывапролд;asdfghjkl,ячсмить;zxcvbnm,ЙЦУКЕНГШЩЗ;QWERTYUIOP,ФЫВАПРОЛД;ASDFGHJKL,ЯЧСМИТЬ;ZXCVBNM"

lua << EOF
  require('init')
  require('vim-plug')
  require('remap')
EOF

