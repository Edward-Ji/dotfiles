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
set completeopt=      " do not show complete option preview

set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" vim-plug automated installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs'
            \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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

" Git diff in sign column
Plug 'airblade/vim-gitgutter'

" File system explorer
Plug 'preservim/nerdtree'

" Comment functions so powerful—no comment necessary
Plug 'preservim/nerdcommenter'

" Fast, as-you-type, fuzzy-search code completion, comprehension and refactoring
Plug 'ycm-core/YouCompleteMe'

" Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Viewing vim and nvim startup event timing information
Plug 'dstein64/vim-startuptime'

" A powerful grammar checker
Plug 'rhysd/vim-grammarous'

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

" Syntastics recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_quiet_messages = { 'regex': '\m\[missing-.*-docstring\]' }

" NERDTree options and shortcuts
let g:NERDTreeIgnore = ['^__']

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
let g:ycm_update_diagnostics_in_insert = 0

" Switch window by direction shortcuts
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

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
