syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set laststatus=2
set mouse=a

set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" vim-plug automated installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Light & Dark color schemes for terminal and GUI Vim awesome editor
Plug 'NLKNguyen/papercolor-theme'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" This is the official theme repository for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Syntax checking plugin
Plug 'scrooloose/syntastic'

" Premier Vim plugin for Git
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

" Use plugged paper color theme
set t_Co=256
set background=light
colorscheme PaperColor

" Set airline variables
let g:airline_theme='papercolor'

" Syntastics recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

