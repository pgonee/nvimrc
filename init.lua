require("packer").startup(function(use)
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
    use 'lifepillar/vim-solarized8'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'github/copilot.vim'
    use ({
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({})
        end,
    })
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "folke/trouble.nvim",
    }
    use 'dense-analysis/ale'

    vim.keymap.set('n', '<localleader>q', ':q<cr>', { noremap = true })
    vim.keymap.set('n', '<localleader>dd', ':NERDTreeToggle<cr>', { noremap = true })
    vim.keymap.set('n', '<localleader>df', ':NERDTreeFind<cr>', { noremap = true })
    vim.keymap.set('n', '<localleader>tt', ':tabnew<cr>', { noremap = true })
    vim.keymap.set('n', '<localleader>tw', ':tabnext<cr>', { noremap = true })
    vim.keymap.set('n', '<localleader>tp', ':tabprev<cr>', { noremap = true })
    vim.keymap.set('n', '<localleader>tq', ':tabclose<cr>', { noremap = true })
    vim.keymap.set('n', '<c-p>', ':Files<cr>', { noremap = true })

    vim.keymap.set('t', '<a-h>', '<c-\\><c-n><c-w>h', { noremap = true })
    vim.keymap.set('t', '<a-j>', '<c-\\><c-n><c-w>j', { noremap = true })
    vim.keymap.set('t', '<a-k>', '<c-\\><c-n><c-w>k', { noremap = true })
    vim.keymap.set('t', '<a-l>', '<c-\\><c-n><c-w>l', { noremap = true })

    vim.keymap.set('t', '<c-\\>tn', '<c-\\><c-n>:tabnext<cr>', { noremap = true })
    vim.keymap.set('t', '<c-\\>tw', '<c-\\><c-n>:tabnext<cr>', { noremap = true })
    vim.keymap.set('t', '<c-\\>tp', '<c-\\><c-n>:tabprev<cr>', { noremap = true })

    vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h', { noremap = true })
    vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j', { noremap = true })
    vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k', { noremap = true })
    vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l', { noremap = true })

    vim.keymap.set('n', '<c-h>', '<c-w><c-h>', { noremap = true })
    vim.keymap.set('n', '<c-j>', '<c-w><c-j>', { noremap = true })
    vim.keymap.set('n', '<c-k>', '<c-w><c-k>', { noremap = true })
    vim.keymap.set('n', '<c-l>', '<c-w><c-l>', { noremap = true })

    vim.keymap.set('n', '<MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('n', '<2-MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('n', '<3-MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('n', '<4-MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('i', '<MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('i', '<2-MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('i', '<3-MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('i', '<4-MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('v', '<MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('v', '<2-MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('v', '<3-MiddleMouse>', '<Nop>', { noremap = true })
    vim.keymap.set('v', '<4-MiddleMouse>', '<Nop>', { noremap = true })

    local telescope_builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

    vim.keymap.set('n', '<esc>', '<c-c>', {})

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
    vim.o.cmdheight = 1
    vim.o.updatetime = 300
    vim.o.signcolumn = 'yes'
    vim.o.scrolloff = 3

    vim.api.nvim_command('set clipboard+=unnamed')
    vim.api.nvim_command('set shortmess+=c')
    vim.api.nvim_command('set mouse=')
    vim.api.nvim_command('syntax on')
    vim.api.nvim_command('syntax enable')
    vim.o.termguicolors = true
    vim.o.background = 'light'
    vim.api.nvim_command('colorscheme solarized8')
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

    highlight! ColorColumn guibg=red ctermbg=red
    highlight! BadWhitespace ctermbg=red guibg=red
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
            { name = 'nvim_lsp', keyword_length = 3 },
        }, {
            { name = 'buffer', keyword_length = 3 },
        }, {
            --{ name = 'path' },
        }, {
            --{ name = 'cmdline' },
        }, {
            { name = 'vsnip' }
        }, {
            { name = "nvim_lsp_signature_help" }
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
        capabilities = capabilities,
        init_options = {
            hostInfo = "neovim",
            preferences = {
                importModuleSpecifierPreference = "non-relative"
            }
        }
    }
    lspconfig.lua_ls.setup {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
                }
            }
        },
        capabilities = capabilities
    }

    require("mason").setup()
end)
