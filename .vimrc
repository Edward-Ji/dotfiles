syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set backspace=2       " indent,eol,start
set expandtab
set smartindent
set number
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set laststatus=2      " always
set mouse=a           " all modes
set foldmethod=syntax
set foldlevelstart=99 " no folds closed
set updatetime=250    " unit: ms
set completeopt=menuone,popup
set splitright

set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

runtime ftplugin/man.vim
