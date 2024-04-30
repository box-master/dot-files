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
set showmatch

colorscheme koehler  

" netrw setting
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set laststatus=2


command -nargs=1 SearchWindow :vimgrep <args> % <bar> :cwin
command -nargs=1 Rename :%s//<args>/g
let mapleader = ' '
inoremap dd <Esc>
nnoremap <silent><leader>w <cmd>w<cr>
nnoremap <silent><leader>q <cmd>q<cr>
nnoremap <silent><leader>a <cmd>Vex!<cr>
nnoremap <silent><leader>h <cmd>noh<cr>
nnoremap <leader>p :SearchWindow 
nnoremap <leader>x :Rename  
nnoremap <c-j> 10j
nnoremap <c-k> 10k
nnoremap <c-h> 10h
nnoremap <c-l> 10l
autocmd FileType python nnoremap <buffer> <silent><leader>e <cmd>vertical botright term python %<cr>
autocmd FileType c nnoremap <buffer> <leader>e <cmd>!gcc %<cr><cmd>vertical botright term ./a.out<cr>
autocmd FileType cuda nnoremap <buffer> <leader>e <cmd>!nvcc  %<cr><cr><cmd>vertical botright term ./a.out<cr>

