packadd vim-jetpack
call jetpack#begin()
  Jetpack 'tani/vim-jetpack', { 'opt': 1 }
  Jetpack 'cohama/lexima.vim'
  Jetpack 'kaicataldo/material.vim'
  Jetpack 'simeji/winresizer'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'vim-airline/vim-airline'
call jetpack#end()

let g:material_theme_style = 'palenight'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

colorscheme material
syntax enable

set number
set title
set showmatch
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set ignorecase
set smartcase
set wrapscan
set whichwrap=h,l
set hlsearch
set incsearch
set laststatus=2
set autoindent
set nrformats=
set history=200
set hidden
set clipboard&
set clipboard^=unnamedplus
set cursorline
set cursorcolumn
set wildmenu
set wildignorecase
set noswapfile
set noshowmode
