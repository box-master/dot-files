set nocompatible
syntax on 
set mouse=nv
set wildmenu
set number
set noruler
set autochdir
set hlsearch
set incsearch
set ignorecase
set autoindent
set termguicolors
set noerrorbells
set visualbell
set t_vb=
set tm=500
set backspace=eol,start,indent
set nobackup
set nowb
set noswapfile
set smarttab

colorscheme koehler  

" netrw setting
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set laststatus=2


let mapleader = ' '
inoremap dd <Esc>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap <leader>e <cmd>!python3 %<cr>
nnoremap <leader>a <cmd>Vex!<cr>
nnoremap <leader>h <cmd>noh<cr>
nnoremap <c-j> 10j
nnoremap <c-k> 10k

