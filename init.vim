call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim' 
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'fatih/vim-go'
Plug 'ervandew/supertab'
Plug 'StanAngeloff/php.vim'

call plug#end()

set number
set ruler
set ts=4 sw=4 sts=4
set expandtab
set smarttab

set splitbelow
set splitright

nnoremap <localleader>q :q<cr>
nnoremap <localleader>dd :NERDTreeToggle<cr>
nnoremap <localleader>tt :tabnew<cr>
nnoremap <localleader>tw :tabnext<cr>
nnoremap <localleader>tp :tabprev<cr>

nnoremap <c-p> :Files<cr>

tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l

tnoremap <c-\>tn <c-\><c-n>:tabnext<cr>
tnoremap <c-\>tw <c-\><c-n>:tabnext<cr>
tnoremap <c-\>tp <c-\><c-n>:tabprev<cr>

tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

vnoremap <leader>c  "+y
nnoremap <leader>C  "+yg_
nnoremap <leader>c  "+y
nnoremap <leader>cc  "+yy

nnoremap <leader>v "+p
nnoremap <leader>V "+P
vnoremap <leader>v "+p
vnoremap <leader>V "+P

syntax enable
set background=dark
colorscheme solarized
