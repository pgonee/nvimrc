require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("neovim/nvim-lspconfig")
    use("junegunn/goyo.vim")
    use("preservim/nerdcommenter")
    use("airblade/vim-gitgutter")
    use("tpope/vim-fugitive")
    use("tpope/vim-surround")
    use("itchyny/lightline.vim")
    use("lukas-reineke/indent-blankline.nvim")
    use("lifepillar/vim-solarized8")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("github/copilot.vim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use({
        "nvimdev/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = function()
            require("lspsaga").setup({})
        end,
    })
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    })
    use({
        "folke/trouble.nvim",
    })
    use("dense-analysis/ale")
    use("jremmen/vim-ripgrep")
    use("mhartington/formatter.nvim")
    use("ryanoasis/vim-devicons")
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional
        },
    })
    use("nvim-tree/nvim-web-devicons")

    vim.keymap.set("n", "<localleader>q", ":q<cr>", { noremap = true })
    vim.keymap.set("n", "<localleader>dd", ":NvimTreeToggle<cr>", { noremap = true })
    vim.keymap.set("n", "<localleader>df", ":NvimTreeFindFile<cr>", { noremap = true })
    vim.keymap.set("n", "<localleader>tt", ":tabnew<cr>", { noremap = true })
    vim.keymap.set("n", "<localleader>tw", ":tabnext<cr>", { noremap = true })
    vim.keymap.set("n", "<localleader>tp", ":tabprev<cr>", { noremap = true })
    vim.keymap.set("n", "<localleader>tq", ":tabclose<cr>", { noremap = true })

    vim.keymap.set("t", "<a-h>", "<c-\\><c-n><c-w>h", { noremap = true })
    vim.keymap.set("t", "<a-j>", "<c-\\><c-n><c-w>j", { noremap = true })
    vim.keymap.set("t", "<a-k>", "<c-\\><c-n><c-w>k", { noremap = true })
    vim.keymap.set("t", "<a-l>", "<c-\\><c-n><c-w>l", { noremap = true })

    vim.keymap.set("t", "<c-\\>tn", "<c-\\><c-n>:tabnext<cr>", { noremap = true })
    vim.keymap.set("t", "<c-\\>tw", "<c-\\><c-n>:tabnext<cr>", { noremap = true })
    vim.keymap.set("t", "<c-\\>tp", "<c-\\><c-n>:tabprev<cr>", { noremap = true })

    vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h", { noremap = true })
    vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j", { noremap = true })
    vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k", { noremap = true })
    vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l", { noremap = true })

    vim.keymap.set("n", "<c-h>", "<c-w><c-h>", { noremap = true })
    vim.keymap.set("n", "<c-j>", "<c-w><c-j>", { noremap = true })
    vim.keymap.set("n", "<c-k>", "<c-w><c-k>", { noremap = true })
    vim.keymap.set("n", "<c-l>", "<c-w><c-l>", { noremap = true })

    vim.keymap.set("n", "<MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("n", "<2-MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("n", "<3-MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("n", "<4-MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("i", "<MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("i", "<2-MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("i", "<3-MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("i", "<4-MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("v", "<MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("v", "<2-MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("v", "<3-MiddleMouse>", "<Nop>", { noremap = true })
    vim.keymap.set("v", "<4-MiddleMouse>", "<Nop>", { noremap = true })

    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            file_ignore_patterns = {
                "node_modules",
                ".git",
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
    })
    telescope.load_extension("fzf")

    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<localleader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = 1})<cr>", {})
    vim.keymap.set("n", "<localleader>fg", telescope_builtin.live_grep, {})
    vim.keymap.set("n", "<localleader>fb", telescope_builtin.buffers, {})
    vim.keymap.set("n", "<localleader>fh", telescope_builtin.help_tags, {})
    vim.keymap.set("n", "<localleader>fr", telescope_builtin.resume, {})

    vim.keymap.set("n", "<esc>", "<c-c>", {})

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

    vim.o.encoding = "utf-8"
    vim.o.nobackup = true
    vim.o.nowritebackup = true
    vim.o.cmdheight = 1
    vim.o.updatetime = 300
    vim.o.signcolumn = "yes"
    vim.o.scrolloff = 3

    vim.api.nvim_set_option("clipboard", "unnamed")
    vim.api.nvim_command("set shortmess+=c")
    vim.api.nvim_command("set mouse=")
    vim.api.nvim_command("syntax on")
    vim.api.nvim_command("syntax enable")
    vim.o.termguicolors = true
    vim.o.background = "light"
    vim.api.nvim_command("colorscheme solarized8")
    vim.o.colorcolumn = "120"

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
    require("nvim-tree").setup({
        filters = {
            git_ignored = false,
            dotfiles = false,
        },
    })
    vim.keymap.set("n", "<leader>xx", function()
        require("trouble").toggle()
    end)

    vim.cmd([[
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

    local cmp = require("cmp")
    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            {
                name = "cmdline",
                option = {
                    ignore_cmds = { "Man", "!" },
                },
            },
        }),
    })
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<c-u>"] = cmp.mapping.scroll_docs(-4),
            ["<c-d>"] = cmp.mapping.scroll_docs(4),
            ["<c-space>"] = cmp.mapping.complete(),
            ["<c-e>"] = cmp.mapping.abort(),
            ["<cr>"] = cmp.mapping.confirm({
                --behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp", keyword_length = 3 },
        }, {
            { name = "buffer", keyword_length = 3 },
        }, {
            { name = "path" },
        }, {
            { name = "luasnip" },
        }, {
            { name = "nvim_lsp_signature_help" },
        }),
    })
    local ls = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

    vim.keymap.set({ "i" }, "<c-k>", function()
        ls.expand()
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<c-l>", function()
        ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<c-j>", function()
        ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<c-e>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, { silent = true })

    require("mason").setup()
    require("mason-lspconfig").setup()

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup({
        capabilities = capabilities,
    })
    local get_root_dir = function(fname)
        local util = require("lspconfig.util")
        return util.root_pattern(".git")(fname)
            or util.root_pattern("pnpm-workspace.yaml", "pnpm-lock.yaml")(fname)
            or util.root_pattern("package.json", "tsconfig.json")(fname)
    end

    lspconfig.tsserver.setup({
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
        capabilities = capabilities,
        root_dir = get_root_dir,
        init_options = {
            hostInfo = "neovim",
            --preferences = {
            --importModuleSpecifierPreference = "non-relative",
            --},
        },
    })
    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
            },
        },
        capabilities = capabilities,
    })

    vim.g.ale_fix_on_save = 0
    vim.g.ale_linters = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "<localleader>gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "<localleader>gd", vim.lsp.buf.definition, opts)
        end,
    })

    local util = require("formatter.util")
    require("formatter").setup({
        logging = true,
        filetype = {
            markdown = require("formatter.filetypes.markdown").prettierd,
            yaml = require("formatter.filetypes.yaml").prettierd,
            css = require("formatter.filetypes.css").prettierd,
            html = require("formatter.filetypes.html").prettierd,
            graphql = require("formatter.filetypes.graphql").prettierd,
            json = require("formatter.filetypes.typescript").prettierd,
            javascript = require("formatter.filetypes.javascript").prettierd,
            javascriptreact = require("formatter.filetypes.javascriptreact").prettierd,
            typescript = require("formatter.filetypes.typescript").prettierd,
            typescriptreact = require("formatter.filetypes.typescriptreact").prettierd,
            lua = {
                function()
                    return {
                        exe = "stylua",
                        args = {
                            "--indent-type Spaces",
                            "--search-parent-directories",
                            "--stdin-filepath",
                            util.escape_path(util.get_current_buffer_file_path()),
                            "--",
                            "-",
                        },
                        stdin = true,
                    }
                end,
            },
            ["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    })

    local formatGroup = vim.api.nvim_create_augroup("Format", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*",
        command = "FormatWrite",
        group = formatGroup,
    })
end)
