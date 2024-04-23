" plugins

call plug#begin()
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'chrisbra/NrrwRgn'
Plug 'Romainl/vim-cool'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/clever-f.vim'
Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-gtfo'
Plug 'luckydev/150colors'
Plug 'jdhao/better-escape.vim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'preservim/vim-pencil'
call plug#end()


" settings
set mouse=nv
set wildmenu
set autochdir
set hlsearch
set incsearch
set ignorecase
set termguicolors
colorscheme matrix
hi Normal guibg=NONE ctermbg=NONE





" mappings
let mapleader=' '
nnoremap <leader>e :!python3 %<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>a :NERDTreeToggle<cr>
vnoremap <leader>v :NarrowRegion<cr>
map <leader>f <Plug>Sneak_s
map <leader>F <Plug>Sneak_s
map <C-f> <Plug>Sneak_;
map <C-d> <Plug>Sneak_,


" plugin settings
let g:clever_f_smart_case=1
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
let g:better_escape_shortcut = 'dd'
let g:doge_mapping= '<leader>u'
let g:doge_doc_standard_python = 'numpy'
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:better_escape_interval = 200
highlight Sneak guifg=white guibg=red



" TODO: netrw, vinegar, fzf

