let g:python_host_prog = '/Users/pgonee/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/pgonee/.pyenv/versions/neovim3/bin/python'
let g:deoplete#enable_at_startup = 1

call plug#begin('~/.config/nvim/plugged')

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'
Plug 'nanotech/jellybeans.vim'

call plug#end()

filetype plugin indent on

set number
set ruler
set ts=4 sw=4 sts=4
set expandtab
set smarttab

set splitbelow
set splitright
set hlsearch
set encoding=utf-8

syntax on
colorscheme jellybeans

highlight colorcolumn guibg=darkred ctermbg=darkred
highlight BadWhitespace ctermbg=darkred guibg=darkred
highlight Search guibg=darkgray ctermbg=darkgray
set colorcolumn=120

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

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

vnoremap <localleader>c  "+y
nnoremap <localleader>C  "+yg_
nnoremap <localleader>c  "+y
nnoremap <localleader>cc  "+yy

nnoremap <localleader>v "+p
nnoremap <localleader>V "+P
vnoremap <localleader>v "+p
vnoremap <localleader>V "+P

nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>
vnoremap <MiddleMouse> <Nop>
vnoremap <2-MiddleMouse> <Nop>
vnoremap <3-MiddleMouse> <Nop>
vnoremap <4-MiddleMouse> <Nop>

let NERDTreeIgnore = [
            \ '\.pyc$',
            \ '\.class$',
            \ '\.so$',
            \ '\.swp$',
            \ '__pycache__$',
            \ '\.beam$',
            \ 'node_modules$',
            \ 'bower_components$'
            \]
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.?(git|hg|svn|node_modules|bower_components)$',
            \ 'file': '\v\.(exe|so|dll|pyc)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
