call plug#begin('~/.config/nvim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim' 
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'fatih/vim-go'
Plug 'ervandew/supertab'
Plug 'StanAngeloff/php.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'hdima/python-syntax'
Plug 'nanotech/jellybeans.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/committia.vim'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hynek/vim-python-pep8-indent'
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'keith/swift.vim'

call plug#end()

set number
set ruler
set ts=4 sw=4 sts=4
set expandtab
set smarttab
set autoindent
set smartindent

set splitbelow
set splitright
set encoding=utf-8
filetype plugin indent on

let python_highlight_all=1
syntax on
colorscheme jellybeans
highlight colorcolumn guibg=darkred ctermbg=darkred
highlight BadWhitespace ctermbg=darkred guibg=darkred
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

vnoremap <leader>c  "+y
nnoremap <leader>C  "+yg_
nnoremap <leader>c  "+y
nnoremap <leader>cc  "+yy

nnoremap <leader>v "+p
nnoremap <leader>V "+P
vnoremap <leader>v "+p
vnoremap <leader>V "+P

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_html_checkers = ['']

let g:jsx_ext_required = 0
