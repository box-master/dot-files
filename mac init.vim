" NOTE: plugins
"-------------------------------------------------------------------------
"################################plugins##################################

call plug#begin()
Plug 'farmergreg/vim-lastplace'
Plug 'folke/flash.nvim'
Plug 'tpope/vim-commentary'
Plug 'kylechui/nvim-surround'
Plug 'chrisbra/NrrwRgn'
Plug 'Romainl/vim-cool'
Plug 'windwp/nvim-autopairs'
Plug 'rhysd/clever-f.vim'
Plug 'justinmk/vim-gtfo'
Plug 'akinsho/toggleterm.nvim'
Plug 'max397574/better-escape.nvim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'luisiacc/the-matrix.nvim'
Plug 'stevearc/oil.nvim'
Plug 'nguyenvukhang/nvim-toggler'
Plug 'svermeulen/vim-yoink'
Plug 'mhinz/vim-startify'
Plug 'folke/todo-comments.nvim'
Plug 'abecodes/tabout.nvim'
Plug 'stevearc/conform.nvim'
call plug#end()

"################################plugins##################################
"-------------------------------------------------------------------------


" NOTE: general settings
"-------------------------------------------------------------------------
"#############################genreal settings############################

set mouse=nv
set wildmenu
set number
set cursorline
set autochdir
set hlsearch
set incsearch
set ignorecase
set termguicolors
colorscheme thematrix
hi cursorline guibg=NONE gui=underline
hi Normal guibg=NONE 
hi Search guibg=red guifg=white
hi NvimTreeNormal guibg=NONE ctermbg=NONE
lua vim.api.nvim_set_hl(0, 'NormalFloat', {bg=NONE})
set laststatus=0
hi! link StatusLine Normal
hi! link StatusLineNC Normal
set statusline=%{repeat('─',winwidth('.'))}
set noruler
set noshowcmd

"#############################genreal settings############################
"-------------------------------------------------------------------------


" NOTE: mappings
"-------------------------------------------------------------------------
"################################mappgins#################################

let mapleader=' '
nnoremap <c-j> 10j
nnoremap <c-k> 10k
nnoremap <leader>e <cmd>vsp<cr><cmd>wincmd l<cr><cmd>term python3 %<cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
xnoremap <leader>v <Plug>NrrwrgnDo
nnoremap <leader>o <cmd>NvimTreeToggle<cr>
nnoremap <leader>a <cmd>Oil --float<cr>
nnoremap <leader>f <cmd>lua require("flash").jump()<cr>
xnoremap <leader>f <cmd>lua require("flash").jump()<cr>
nnoremap <c-h> <cmd>exe v:count1 . "ToggleTerm"<cr>
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-h> <cmd>exe v:count1 . "ToggleTerm"<cr>
nnoremap <leader>r <cmd> lua require("conform").format()<cr>
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
let g:doge_mapping= '<leader>u'

"################################mappgins#################################
"-------------------------------------------------------------------------



" NOTE: plugin settings (vimscirpt)
"-------------------------------------------------------------------------
"######################plugin setting (vimscript)#########################
let g:clever_f_smart_case=1
lua require("toggleterm").setup{direction = 'float', float_opts = {width=70,height=20}}
let g:doge_doc_standard_python = 'numpy'
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:nrrw_topbot_leftright = 'botright'
let g:loaded_netrw = 1
let g:startify_custom_header = []
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
hi FlashLabel guifg=red gui=bold

" startify config
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ ]
let g:startify_bookmarks = [{'f':'/Users/po-chun/Desktop/qlm/projects/valley pseudo spin kerr rotation'},{'d':'/Users/po-chun/OneDrive/qlm/kerr rotation/python'}]


"######################plugin setting (vimscript)#########################
"-------------------------------------------------------------------------


" NOTE: plugin settings (lua)
"-------------------------------------------------------------------------
"######################plugin setting (lua)###############################
lua << EOF
local nvim_tree = require('nvim-tree')
local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 70
local height = 20
 
nvim_tree.setup{
  view = {
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        width = width,
        height = height,
        row = (gheight - height) * 0.4,
        col = (gwidth - width) * 0.5,
      }
    }
  }
}
EOF


lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "python"  },
  highlight = {enable=true},
  auto_install = true,
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner"},
        ["as"] = { query = "@scope", query_group = "locals" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
      },
    },
  },
}
EOF


lua << EOF
require("oil").setup{
	delete_to_trash = true,
}
EOF


lua << EOF
require('todo-comments').setup{
	signs=false,
	colors = {
	    error = {"#FA0202" },
	    warning = {"#FA0202" },
	    info = {"#F6FA02" },
	    hint = {"#6AFA02" },
	    default = {"#F5FFF0" },
	    test = {"#FA8F02" }
	},
	highlight={multiline=false},
}
EOF

lua << EOF
require("conform").setup({
  formatters_by_ft = {
    python = { "isort", "black"},
  },
})
EOF

lua << EOF
require("better_escape").setup {
    mapping = {"dd"}, 
    timeout = 200, 
}
EOF


lua require('nvim-toggler').setup()
lua require('nvim-autopairs').setup()
lua require('tabout').setup()
lua require("nvim-surround").setup()
lua require("flash").setup{modes={search={enabled=false}}}

"######################plugin setting (lua)###############################
"-------------------------------------------------------------------------
