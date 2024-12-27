call plug#begin()
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'windwp/nvim-autopairs'
	Plug 'felipeagc/fleet-theme-nvim'
	Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-tree/nvim-web-devicons'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

lua << EOF
require("nvim-autopairs").setup {}

require("nvim-treesitter.configs").setup {
  auto_install = true
}

require("ibl").setup {}
EOF

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

nnoremap <C-f> :Neotree toggle right<CR>

colorscheme fleet
