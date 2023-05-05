packadd vim-jetpack
call jetpack#begin()
  Jetpack 'tani/vim-jetpack', { 'opt': 1 }
  Jetpack 'cohama/lexima.vim'
  Jetpack 'kaicataldo/material.vim'
  Jetpack 'lambdalisue/fern.vim'
  Jetpack 'lambdalisue/fern-git-status.vim'
  Jetpack 'lambdalisue/fern-hijack.vim'
  Jetpack 'lambdalisue/fern-renderer-nerdfont.vim'
  Jetpack 'lambdalisue/nerdfont.vim'
  Jetpack 'simeji/winresizer'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'vim-airline/vim-airline'
  Jetpack 'yuki-yano/fern-preview.vim'
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

nnoremap <leader>ff :Fern . -reveal=%<CR><CR>
nnoremap <leader>fd :Fern . -reveal=% -drawer -toggle<CR><CR>

function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
  nmap <silent> <buffer> <C-h> <Plug>(fern-action-hidden:toggle)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

let g:fern#renderer = "nerdfont"
let g:fern#renderer#nerdfont#indent_markers = 1
