require("packer").startup(function(use)
    vim.cmd([[
    lang ko_KR
    ]])

    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
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
    use 'nanotech/jellybeans.vim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use({
        'jose-elias-alvarez/null-ls.nvim',
        requires = { "nvim-lua/plenary.nvim" }
    })
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
            {"nvim-tree/nvim-web-devicons"},
        }
    })

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

    vim.api.nvim_set_keymap('n', '<esc>', '<c-c>', {})

    vim.cmd([[
    filetype plugin indent on
    ]])
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
    vim.o.background = 'dark'
    vim.api.nvim_command('colorscheme jellybeans')
    vim.o.colorcolumn = '120'

    vim.cmd([[
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

    let g:goyo_width = 120
    let g:goyo_height = '94%'

    function! s:goyo_enter()
    set nu
    endfunction

    function! s:goyo_leave()
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
    ]])

    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<c-u>'] = cmp.mapping.scroll_docs(-4),
            ['<c-d>'] = cmp.mapping.scroll_docs(4),
            ['<c-space>'] = cmp.mapping.complete(),
            ['<c-e>'] = cmp.mapping.abort(),
            ['<cr>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
        }, {
            { name = 'buffer' },
        },{
            { name = 'path' },
        },{
            { name = 'cmdline' },
        }, {
            { name = 'vsnip' }
        })
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup {
        capabilities = capabilities
    }
    lspconfig.tsserver.setup {
        filetypes = {
            "typescript", "typescriptreact", "typescript.tsx"
        },
        capabilities = capabilities
    }
    lspconfig.lua_ls.setup {
        settings = {
            Lua = {
                diagnostics = {
                    globals = {'vim'}
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
                }
            }
        },
        capabilities = capabilities
    }

    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.prettierd,
        },

        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    })

    require("lspsaga").setup({})
end)