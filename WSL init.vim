" NOTE: plugins
"##################################################################################################################
call plug#begin()
Plug 'farmergreg/vim-lastplace' " open lastplace 
Plug 'numToStr/Comment.nvim' " toggle comment (keymap: gc)
Plug 'kylechui/nvim-surround' " deal with (),[]...
Plug 'chrisbra/NrrwRgn' " create a scratch file for selected region
Plug 'Romainl/vim-cool' " it's cool
Plug 'windwp/nvim-autopairs' " autopair (),[]...
Plug 'rhysd/clever-f.vim' "enhance f functionality
Plug 'akinsho/toggleterm.nvim' " toggle terminal in vim
Plug 'max397574/better-escape.nvim' 
Plug 'justinmk/vim-sneak' "vim motion
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " auto-generate doc string
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlight
Plug 'nvim-treesitter/nvim-treesitter-textobjects' " extended text objects
Plug 'nvim-tree/nvim-tree.lua' " file tree
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " colorscheme
Plug 'stevearc/oil.nvim' " file management system
Plug 'nguyenvukhang/nvim-toggler' " toggle bool value
Plug 'svermeulen/vim-yoink' " preserve multiple yank
Plug 'mhinz/vim-startify' " starup page
Plug 'folke/todo-comments.nvim' " hilight todo
Plug 'abecodes/tabout.nvim' " jump out (),[], <c-q>
Plug 'nvim-lualine/lualine.nvim' " status line
Plug 'ryanoasis/vim-devicons' " icons
Plug 'stevearc/conform.nvim' " code formating
Plug 'nvim-lua/plenary.nvim' " telescope requirement
Plug 'nvim-telescope/telescope.nvim' " find file, find diagonstics, ... , find everything 
" lsp config
Plug 'neovim/nvim-lspconfig' " official lsp config 
Plug 'williamboman/mason.nvim' " lsp installer 
Plug 'williamboman/mason-lspconfig.nvim' " lsp setup
" completion setup
Plug 'hrsh7th/cmp-nvim-lsp'  " lsp completion
Plug 'hrsh7th/cmp-buffer' " buffer completion
Plug 'hrsh7th/cmp-path' " path completion
Plug 'hrsh7th/cmp-cmdline' " command completion
Plug 'hrsh7th/nvim-cmp' " completion core
" snippet
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " snippet eingine
Plug 'saadparwaiz1/cmp_luasnip' " snippet completion
Plug 'rafamadriz/friendly-snippets' " snippets
" lsp related
Plug 'rmagatti/goto-preview' " vscode-like peek reference, definition, declaration
call plug#end()
"##################################################################################################################


"NOTE: general settings
"##################################################################################################################
set mouse=nv
set wildmenu
set cursorline
set cursorcolumn
set number
set autochdir
set hlsearch
set incsearch
set ignorecase
set termguicolors
set visualbell
set t_vb=
colorscheme catppuccin-mocha
"##################################################################################################################




"NOTE:  mappings
"##################################################################################################################
let mapleader=' '
nnoremap <silent><leader>e <cmd>!python3 %<cr>
nnoremap <silent><leader>w <cmd>w<cr>
nnoremap <silent><leader>q <cmd>q<cr>
xnoremap <silent><leader>v <Plug>NrrwrgnDo
nnoremap <silent><leader>a <cmd>Oil --float<cr>
nnoremap <silent><leader>r <cmd>lua require("conform").format()<cr>
nnoremap <silent><leader>s <cmd>lua Toggle_diagnostics()<cr>
nnoremap <silent><leader>p <cmd>Telescope find_files<cr>
nnoremap <silent><leader>o <cmd>NvimTreeToggle<cr>
nnoremap <silent><leader>ha <cmd>:lua require('telescope.builtin').lsp_document_symbols({ symbols='function' })<cr>
nnoremap <silent><leader>hs <cmd>Telescope diagnostics<cr>
nnoremap <silent><leader>hh <cmd>lua require('goto-preview').goto_preview_definition()<cr>
nnoremap <silent><leader>hj <cmd>lua require('goto-preview').goto_preview_declaration()<cr>
nnoremap <silent><leader>hk <cmd>lua require('goto-preview').goto_preview_references()<cr>
nnoremap <silent>g] <cmd>lua require("todo-comments").jump_next()<cr>
nnoremap <silent>g[ <cmd>lua require("todo-comments").jump_prev()<cr>
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent>gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<cr>
map <leader>f <Plug>Sneak_s
map <leader>d <Plug>Sneak_S
map <C-f> <Plug>Sneak_;
map <C-d> <Plug>Sneak_,
let g:doge_mapping= '<leader>u'
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-b> <plug>(YoinkPostPasteSwapForward)
nnoremap <silent><c-h> <cmd>exe v:count1 . "ToggleTerm"<cr>
autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-h> <cmd>exe v:count1 . "ToggleTerm"<cr>
"##################################################################################################################




"NOTE: plugin config
"##################################################################################################################
let g:clever_f_smart_case=1
let g:better_escape_shortcut = 'dd'
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:doge_doc_standard_python = 'numpy'
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:better_escape_interval = 200
hi Sneak guibg=#bdffda guifg=black 
let g:nrrw_topbot_leftright = 'botright'
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ ]
let g:startify_bookmarks = [{'a':'/mnt/c/Users/Po-Chun Huang/OneDrive/qlm'},{'s':'/mnt/c/Users/Po-Chun Huang/Desktop'},{'d':'/mnt/c/Users/Po-Chun Huang/OneDrive'}]
let g:startify_custom_header=[]


lua require("toggleterm").setup{direction = 'float', float_opts = {width=70,height=20}}
lua require('tabout').setup{tabkey='<C-q>',backwards_tabkey='<C-w>'}
lua require('nvim-toggler').setup()
lua require('nvim-autopairs').setup()
lua require('nvim-surround').setup()
lua require('Comment').setup()
lua require('goto-preview').setup()


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
require("oil").setup{
	delete_to_trash = true,
	float = {max_width=90,max_height=30}
}
EOF


lua << EOF
require('todo-comments').setup{
	signs=false,
	highlight={multiline=false},
}
EOF



lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c",  "lua", "vim", "python"  },
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
        ["ic"] = { query = "@class.inner" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
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
require('lualine').setup{
	sections = {
	    lualine_a = {'mode'},
	    lualine_b = {'branch'},
	    lualine_c = {'filename','filetype','diagnostics'},
	    lualine_x = {'datetime'},
	    lualine_y = {'progress'},
	    lualine_z = {'location'}
	  },
}
EOF

lua << EOF
require("catppuccin").setup({
    integrations = {
        nvimtree = true,
        treesitter = true,
    }
})
EOF

lua << EOF
require("conform").setup({
  formatters_by_ft = {
    python = { "isort", "black" },
  },
})
EOF

lua << EOF
require("better_escape").setup {
    mapping = {"dd"}, 
    timeout = 200, 
}
EOF

lua << EOF
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      n = {
        ["<leader>q"] = actions.close
      },
    },
  }
}
EOF


"##################################################################################################################


" NOTE: lsp config
"##################################################################################################################
" official lsp setup
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {"clangd","pyright"}
}
EOF


" official completion set up
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		else
			fallback()
		end
       end, {"i", "s"}),
       ["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
        end, {"i", "s"}),

    }),

    
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    }),
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF


" official snippet config
lua require("luasnip.loaders.from_vscode").lazy_load()


" my lsp config
lua << EOF
vim.g["diagnostics_active"] = true
function Toggle_diagnostics()
    if vim.g.diagnostics_active then
        vim.g.diagnostics_active = false
        vim.diagnostic.disable()
    else
        vim.g.diagnostics_active = true
        vim.diagnostic.enable()
    end
end
EOF
"##################################################################################################################


