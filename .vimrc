set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'farfanoide/vim-kivy'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'lambdatoast/elm.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ################
let mapleader = ","

" Enable folding
set foldmethod=indent
set foldlevel=99


" Enable folding with the spacebar
nnoremap <space> za


let g:SimpylFold_docstring_preview=1


" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


" Misc indentation
au BufNewFile,BufRead *.js, *.html, *.css, *rc
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


set encoding=utf-8


" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_auto_trigger = 0


" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" highlight
let python_highlight_all=1
syntax on


" color scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" toggle color theme
call togglebg#map("<F5>")


" define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=darkgreen guibg=lightgreen

" Bad Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set list

" NERDTree ignore pyc
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" NERDTree toggle
nmap <F3> :NERDTreeToggle<CR>

" Line Numbering
set nu


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Cycling buffers with <Tab>
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" keep buffer undo history when buffer is changed
set hidden

" don't autoload session on opening
:let g:session_autoload = 'no'
