require("packer").startup(function(use)

use "wbthomason/packer.nvim"
use "neovim/nvim-lspconfig"
use "nanotech/jellybeans.vim"
use "scrooloose/nerdtree"
use 'junegunn/goyo.vim'
use 'preservim/nerdcommenter'
use 'airblade/vim-gitgutter'
use 'tpope/vim-fugitive'
use 'tpope/vim-surround'
use 'itchyny/lightline.vim'
use 'lukas-reineke/indent-blankline.nvim'
use {
    'junegunn/fzf', run = function() vim.fn['fzf#install'](0) end
}


vim.api.nvim_set_keymap('n', '<localleader>q', ':q<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>dd', ':NERDTreeToggle<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>df', ':NERDTreeFind<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>tt', ':tabnew<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>tw', ':tabnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>tp', ':tabprev<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>tq', ':tabclose<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-p>', ':FZF<cr>', {noremap = true})

vim.api.nvim_set_keymap('t', '<a-h>', '<c-\\><c-n><c-w>h', {noremap = true})
vim.api.nvim_set_keymap('t', '<a-j>', '<c-\\><c-n><c-w>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<a-k>', '<c-\\><c-n><c-w>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<a-l>', '<c-\\><c-n><c-w>l', {noremap = true})

vim.api.nvim_set_keymap('t', '<c-\\>tn', '<c-\\><c-n>:tabnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('t', '<c-\\>tw', '<c-\\><c-n>:tabnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('t', '<c-\\>tp', '<c-\\><c-n>:tabprev<cr>', {noremap = true})

vim.api.nvim_set_keymap('t', '<c-h>', '<c-\\><c-n><c-w>h', {noremap = true})
vim.api.nvim_set_keymap('t', '<c-j>', '<c-\\><c-n><c-w>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<c-k>', '<c-\\><c-n><c-w>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<c-l>', '<c-\\><c-n><c-w>l', {noremap = true})

vim.api.nvim_set_keymap('n', '<c-h>', '<c-w><c-h>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w><c-j>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w><c-k>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w><c-l>', {noremap = true})

vim.api.nvim_set_keymap('n', '<MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('n', '<2-MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('n', '<3-MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('n', '<4-MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('i', '<MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('i', '<2-MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('i', '<3-MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('i', '<4-MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('v', '<MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('v', '<2-MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('v', '<3-MiddleMouse>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('v', '<4-MiddleMouse>', '<Nop>', {noremap = true})

vim.o.number = true
vim.o.ruler = true
vim.o.ts = 4
vim.o.sw = 4
vim.o.sts = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hlsearch = true

vim.o.encoding = 'utf-8'
vim.o.nobackup = true
vim.o.nowritebackup = true
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 3

vim.api.nvim_command('set clipboard+=unnamed')
vim.api.nvim_command('set shortmess+=c')
vim.api.nvim_command('syntax on')
vim.api.nvim_command('syntax enable')
vim.api.nvim_command('colorscheme jellybeans')

vim.api.nvim_command('highlight colorcolumn guibg=darkred ctermbg=darkred')
vim.api.nvim_command('highlight BadWhitespace ctermbg=darkred guibg=darkred')
vim.api.nvim_command('highlight Search guibg=darkgray ctermbg=darkgray')
vim.o.colorcolumn = 120

vim.go.goyo_width = 120
vim.go.goyo_height = '50%'

end)

--lang ko_KR

--call plug#begin('~/.config/nvim/plugged')

--Plug 'neovim/nvim-lspconfig'
--Plug 'nanotech/jellybeans.vim'
--Plug 'junegunn/goyo.vim'
--Plug 'scrooloose/nerdtree'
--Plug 'preservim/nerdcommenter'
--Plug 'airblade/vim-gitgutter'
--Plug 'tpope/vim-fugitive'
--Plug 'tpope/vim-surround'
--Plug 'itchyny/lightline.vim'
--Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
--Plug 'lukas-reineke/indent-blankline.nvim'

--call plug#end()

--filetype plugin indent on

--set number
--set ruler
--set ts=4 sw=4 sts=4
--set expandtab
--set smarttab
--set autoindent
--set smartindent

--set splitbelow
--set splitright
--set hlsearch

--set encoding=utf-8
--set nobackup
--set nowritebackup
--set cmdheight=2
--set updatetime=300
--set shortmess+=c
--set signcolumn=yes
--set clipboard+=unnamed

--syntax on
--syntax enable
--colorscheme jellybeans

--set scrolloff=3

--highlight colorcolumn guibg=darkred ctermbg=darkred
--highlight BadWhitespace ctermbg=darkred guibg=darkred
--highlight Search guibg=darkgray ctermbg=darkgray
--set colorcolumn=120

--nnoremap <localleader>q :q<cr>
--nnoremap <localleader>dd :NERDTreeToggle<cr>
--nnoremap <localleader>df :NERDTreeFind<cr>
--nnoremap <localleader>tt :tabnew<cr>
--nnoremap <localleader>tw :tabnext<cr>
--nnoremap <localleader>tp :tabprev<cr>
--nnoremap <localleader>tq :tabclose<cr>

--command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
--nnoremap <localleader>pre :Prettier<cr>

--nnoremap <Plug>(ShowCurrentFile) :echo @%<cr>

--nmap sf <Plug>(ShowCurrentFile)

--nnoremap <c-p> :FZF<cr>

--tnoremap <a-h> <c-\><c-n><c-w>h
--tnoremap <a-j> <c-\><c-n><c-w>j
--tnoremap <a-k> <c-\><c-n><c-w>k
--tnoremap <a-l> <c-\><c-n><c-w>l

--tnoremap <c-\>tn <c-\><c-n>:tabnext<cr>
--tnoremap <c-\>tw <c-\><c-n>:tabnext<cr>
--tnoremap <c-\>tp <c-\><c-n>:tabprev<cr>

--tnoremap <c-h> <c-\><c-n><c-w>h
--tnoremap <c-j> <c-\><c-n><c-w>j
--tnoremap <c-k> <c-\><c-n><c-w>k
--tnoremap <c-l> <c-\><c-n><c-w>l

--nnoremap <c-h> <c-w><c-h>
--nnoremap <c-j> <c-w><c-j>
--nnoremap <c-k> <c-w><c-k>
--nnoremap <c-l> <c-w><c-l>

--vnoremap <localleader>c  "+y

--nnoremap <localleader>v "+p
--nnoremap <localleader>V "+P
--vnoremap <localleader>v "+p
--vnoremap <localleader>V "+P

--nnoremap <MiddleMouse> <Nop>
--nnoremap <2-MiddleMouse> <Nop>
--nnoremap <3-MiddleMouse> <Nop>
--nnoremap <4-MiddleMouse> <Nop>
--inoremap <MiddleMouse> <Nop>
--inoremap <2-MiddleMouse> <Nop>
--inoremap <3-MiddleMouse> <Nop>
--inoremap <4-MiddleMouse> <Nop>
--vnoremap <MiddleMouse> <Nop>
--vnoremap <2-MiddleMouse> <Nop>
--vnoremap <3-MiddleMouse> <Nop>
--vnoremap <4-MiddleMouse> <Nop>

--let NERDTreeIgnore = [
            --\ '\.pyc$',
            --\ '\.class$',
            --\ '\.so$',
            --\ '\.swp$',
            --\ '__pycache__$',
            --\ '\.beam$',
            --\ 'node_modules$',
            --\ 'bower_components$'
            --\]

--let g:python_host_prog = '/Users/pgonee/.pyenv/versions/neovim2/bin/python'
--let g:python3_host_prog = '/Users/pgonee/.pyenv/versions/neovim3/bin/python'

--let g:goyo_width=100
--let g:goyo_height='100%'

--function! s:goyo_enter()
    --set nu
--endfunction

--function! s:goyo_leave()
    --highlight colorcolumn guibg=darkred ctermbg=darkred
    --highlight BadWhitespace ctermbg=darkred guibg=darkred
    --highlight Search guibg=darkgray ctermbg=darkgray
--endfunction

--autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
--autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
--autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
--autocmd! User GoyoEnter nested call <SID>goyo_enter()
--autocmd! User GoyoLeave nested call <SID>goyo_leave()

--nmap <esc> <c-c>
--set diffopt+=vertical
