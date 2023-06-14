set number
set relativenumber
set cursorline
" Lines to always show above/below cursor
set scrolloff=5

set tabstop=2
set shiftwidth=2
set expandtab 

" Changing defaults for 'Explorer' mode, etc
" Defaults are: noma nomod nonu nowrap ro nobl
let g:netrw_bufsettings = 'noma nomod nu relnum nowrap ro nobl'
let g:netrw_preview = 1 " Vertical split for preview
let g:netrw_winsize = 30

set noswapfile 
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile

" set guicursor=""
set termguicolors

highlight Pmenu ctermfg=white ctermbg=darkblue
highlight PmenuSel ctermfg=black ctermbg=yellow

" Seems like this won't work for multichar mappings
" https://github.com/vim/vim/issues/3018#issuecomment-1206100569
set langmap="йцукенгшщз;qwertyuiop,фывапролд;asdfghjkl,ячсмить;zxcvbnm,ЙЦУКЕНГШЩЗ;QWERTYUIOP,ФЫВАПРОЛД;ASDFGHJKL,ЯЧСМИТЬ;ZXCVBNM"

lua << EOF
  require('vim-plug')
  require('remap')
EOF

let g:onedark_config = { 'style': 'light' }
set background=light
colorscheme onedark
