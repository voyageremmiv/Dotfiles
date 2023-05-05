packadd vim-jetpack
call jetpack#begin()
  Jetpack 'tani/vim-jetpack', { 'opt': 1 }
  Jetpack 'airblade/vim-gitgutter'
  Jetpack 'cohama/lexima.vim'
  Jetpack 'kaicataldo/material.vim'
  Jetpack 'lambdalisue/fern.vim'
  Jetpack 'lambdalisue/fern-git-status.vim'
  Jetpack 'lambdalisue/fern-hijack.vim'
  Jetpack 'lambdalisue/fern-renderer-nerdfont.vim'
  Jetpack 'lambdalisue/gin.vim'
  Jetpack 'lambdalisue/nerdfont.vim'
  Jetpack 'nvim-lua/plenary.nvim'
  Jetpack 'nvim-telescope/telescope.nvim'
  Jetpack 'nvim-treesitter/nvim-treesitter'
  Jetpack 'nvim-tree/nvim-web-devicons'
  Jetpack 'simeji/winresizer'
  Jetpack 'thinca/vim-qfreplace'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'tpope/vim-fugitive'
  Jetpack 'vim-airline/vim-airline'
  Jetpack 'vim-denops/denops.vim'
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

nnoremap <leader>fq :bd<CR>
nnoremap <leader>fr :Qfreplace<CR>

nnoremap <leader>fz <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

nnoremap <leader>gb :GinBranch<CR>
nnoremap <leader>gc :GinChaperon<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gl :GinLog ++opener=vsplit<CR>
nnoremap <leader>gp :GinPatch ++opener=tabnew %<CR>
nnoremap <leader>gs :GinStatus<CR>
nnoremap <leader>gw :Git blame<CR>

nnoremap <leader>dh :diffget //2 <Bar> diffup<CR>
nnoremap <leader>dl :diffget //3 <Bar> diffup<CR>

set updatetime=100
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    highlight = { enable = true, },
    indent = { enable = true, }
  }

  require'telescope'.setup {
    defaults = {
      mappings = {
        i = {
          ["<C-a>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist
        }
      }
    }
  }
EOF
