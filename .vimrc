syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set backspace=2       " indent,eol,start
set expandtab
set smartindent
set number
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
set updatetime=100    " unit: ms
set completeopt=menuone,popup
set splitright

set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

runtime ftplugin/man.vim

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs'
            \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Light & Dark color schemes for terminal and GUI Vim awesome editor
Plug 'NLKNguyen/papercolor-theme'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" This is the official theme repository for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Premier Vim plugin for Git
Plug 'tpope/vim-fugitive'

" Git diff in sign column
Plug 'airblade/vim-gitgutter'

" File system explorer
Plug 'preservim/nerdtree'

" Comment functions so powerful—no comment necessary
Plug 'preservim/nerdcommenter'

" Fast, as-you-type, fuzzy-search code completion, comprehension and refactoring
Plug 'ycm-core/YouCompleteMe'

" Linting (syntax checking and semantic errors)
Plug 'dense-analysis/ale'

" Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Modifies Vim’s indentation behavior to comply with PEP8
Plug 'Vimjas/vim-python-pep8-indent'

" Initialize plugin system
call plug#end()

" Use plugged paper color theme
set t_Co=256
set background=light
colorscheme PaperColor

" Set airline options
let g:airline_theme='papercolor'

function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g') . ' | '
     \ . substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction
call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

" NERDTree options and shortcuts
let g:NERDTreeIgnore = ['__pycache__']

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" NERDCommenter options
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_python = 1

" YouCompleteMe options
let g:ycm_always_populate_location_list = 1
let g:ycm_auto_hover = ''
let g:ycm_key_invoke_completion = '<A-Space>'
let g:ycm_show_detailed_diag_in_popup = 1
let g:ycm_update_diagnostics_in_insert = 0

nmap <leader>D <plug>(YCMHover)

function! s:CustomizeYcmLocationWindow()
    setlocal wrap
endfunction

autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

function! s:CustomizeYcmQuickFixWindow()
    setlocal wrap
endfunction

autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()

" Run PlugUpdate every week automatically when entering Vim.
" https://gist.github.com/kkoomen/68319b08ab843ce67cf7b282b0b2fd24
function! PlugUpdate() abort
    if exists('g:plug_home')
        let l:filename = printf('%s/.vim_plug_update', g:plug_home)
        if filereadable(l:filename) == 0
            call writefile([], l:filename)
        endif

        let l:this_week = strftime('%Y_%V')
        let l:contents = readfile(l:filename)
        if index(l:contents, l:this_week) < 0
            call execute('PlugUpdate')
            call writefile([l:this_week], l:filename, 'a')
        endif
    endif
endfunction

autocmd VimEnter * call PlugUpdate()
