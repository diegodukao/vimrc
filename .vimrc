"Vundle Config
"##################################################################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
" Color Plugins
Plugin 'jnurmine/Zenburn'  " Terminal mode
Plugin 'altercation/vim-colors-solarized'  " GUI mode

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Choosing correct colorscheme
if has('gui_running')
    set background=dark
    colorscheme solarized
    "enabling solarized theme change with f5
    call togglebg#map("<F5>")
else
    colorscheme zenburn
endif

"Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    "\ set textwidth=80 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"Webdev files indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

"UTF-8 support
set encoding=utf-8

"NERDTree ignore files
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__/']
"NERDTtree toggle Keymapping
map <F4> :NERDTreeToggle<CR>

"split navigations
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"code folding
set foldmethod=indent
"opening files unfolded
au BufRead * normal zR
" Enable folding with the spacebar
nnoremap <space> za

"python highlight
let python_highlight_all=1
syntax on

"executing pyflakes with python3
let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'

"different cursor for modes in terminal
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
"reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

"disabling gui options
set guioptions=
set mouse=c
