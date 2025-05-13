-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.clipboard:append("unnamedplus")
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        "wbthomason/packer.nvim",
        {
            "numToStr/Comment.nvim",
            opts = {},
        },
        "airblade/vim-gitgutter",
        "tpope/vim-fugitive",
        "tpope/vim-surround",
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 10000,
            opts = {},
        },
        "lukas-reineke/indent-blankline.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        {
            "nvimdev/lspsaga.nvim",
            dependencies = { "nvim-lspconfig" },
            config = function()
                require("lspsaga").setup({})
            end,
        },
        {
            "williamboman/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = {
                "nvim-lua/plenary.nvim",
                {
                    "nvim-telescope/telescope-live-grep-args.nvim",
                    version = "^1.1.0",
                },
            },
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        },
        {
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        "dense-analysis/ale",
        "mhartington/formatter.nvim",
        "ryanoasis/vim-devicons",
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        {
            "nvim-treesitter/nvim-treesitter",
            build = function()
                require("nvim-treesitter.install").update({ with_sync = false })
            end,
        },
        {
            "ThePrimeagen/refactoring.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
            },
            config = function()
                require("refactoring").setup()
            end,
        },
        "sindrets/diffview.nvim",
        {
            "luukvbaal/nnn.nvim",
            config = function()
                require("nnn").setup()
            end,
        },
    },
})

vim.api.nvim_create_user_command("Rfinder", function()
    local path = vim.api.nvim_buf_get_name(0)
    os.execute("open -R " .. path)
end, {})

vim.keymap.set("n", "<localleader>q", ":q<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>o", ":Rfinder<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>dd", ":NvimTreeToggle<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>df", ":NnnExplorer<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>tt", ":tabnew<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>tw", ":tabnext<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>tp", ":tabprev<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>tq", ":tabclose<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>pd", ":Lspsaga peek_definition<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>ol", ":Lspsaga outline<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>fu", ":Lspsaga finder<cr>", { noremap = true })

vim.keymap.set("n", "<localleader>z", ":ZenMode<cr>", { noremap = true })
vim.keymap.set("n", "<localleader>T", ":terminal<cr>", { noremap = true })

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
vim.keymap.set("i", "<c-s>", "<c-o>:lua vim.lsp.buf.signature_help()<cr>", { noremap = true })

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

vim.o.encoding = "utf-8"
vim.o.cmdheight = 1
vim.o.updatetime = 300
vim.o.signcolumn = "yes"
vim.o.scrolloff = 3
vim.o.conceallevel = 0
vim.o.foldenable = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.api.nvim_command("set shortmess+=c")
vim.api.nvim_command("set mouse=")
vim.api.nvim_command("syntax on")
vim.api.nvim_command("syntax enable")
vim.o.colorcolumn = "120"
vim.o.background = "light"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("tokyonight").setup({
    style = "day",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    day_brightness = 0.2,
})
vim.api.nvim_command("colorscheme tokyonight-day")
vim.opt.termguicolors = true
vim.opt.swapfile = false

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})

local trouble = require("trouble")
local symbols = trouble.statusline({
    mode = "lsp_document_symbols",
    groups = {},
    title = false,
    filter = { range = true },
    format = "{kind_icon}{symbol.name:Normal}",
    -- The following line is needed to fix the background color
    -- Set it to the lualine section you want to use
    hl_group = "lualine_c_normal",
})

local lualineConfigs = require("lualine").get_config()
table.insert(lualineConfigs.sections.lualine_c, {
    symbols.get,
    cond = symbols.has,
})

local telescope = require("telescope")
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-Down>"] = require("telescope.actions").cycle_history_next,
                ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
                ["<C-x>"] = require("trouble.sources.telescope").open,
            },
        },
        file_ignore_patterns = {
            "node_modules/",
            "dist/",
            "build/",
            "storybook-static/",
            "%.git/",
            "%.next/",
            "%.idea/",
            "%.DS_Store/",
            "%.turbo/",
            "%.vercel/",
            "%.vscode/",
        },
    },
    pickers = {
        find_files = {
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--no-ignore",
                "--glob",
                "!**/.git/*",
                "--glob",
                "!**/node_modules/*",
                "--glob",
                "!**/.idea/*",
                "--glob",
                "!**/.DS_Store/*",
                "--glob",
                "!**/.turbo/*",
                "--glob",
                "!**/.vercel/*",
                "--glob",
                "!**/.vscode/*",
                "--glob",
                "!**/.next/*",
                "--glob",
                "!**/dist/*",
                "--glob",
                "!**/storybook-static/*",
                "--glob",
                "!**/build/*",
            },
        },
        live_grep = {
            additional_args = function(opts)
                return { "--hidden" }
            end,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            --override_generic_sorter = true, -- override the generic sorter
            --override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
})
telescope.load_extension("fzf")
telescope.load_extension("refactoring")
telescope.load_extension("live_grep_args")

local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<localleader>ff", "<cmd>lua require('telescope.builtin').find_files({ previewer = true })<cr>", {})
vim.keymap.set("n", "<localleader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
vim.keymap.set("n", "<localleader>fb", telescope_builtin.buffers, {})
vim.keymap.set("n", "<localleader>fh", telescope_builtin.help_tags, {})
vim.keymap.set("n", "<localleader>fr", telescope_builtin.resume, {})
vim.keymap.set("n", "<localleader>rr", function()
    require("telescope").extensions.refactoring.refactors()
end)
vim.keymap.set("n", "<localleader>rn", vim.lsp.buf.rename, {})

vim.keymap.set("n", "<esc>", "<c-c>", {})

require("nvim-tree").setup({
    view = {
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 50,
                row = 0,
                col = 0,
            },
        },
    },
    git = {
        enable = false,
    },
    filters = {
        git_ignored = false,
        dotfiles = false,
        custom = {
            ".DS_Store",
            "node_modules",
        },
    },
})

vim.keymap.set("n", "<localleader>xX", function()
    trouble.toggle("diagnostics")
end, { noremap = true })
vim.keymap.set("n", "<localleader>xx", function()
    trouble.toggle("diagnostics", {
        buf = 0,
    })
end, { noremap = true })
vim.keymap.set("n", "<localleader>xq", function()
    trouble.toggle("quickfix")
end, { noremap = true })
vim.keymap.set("n", "<localleader>xl", function()
    trouble.toggle("loclist")
end, { noremap = true })

require("nvim-treesitter").setup()
require("nvim-treesitter.configs").setup({
    modules = {},
    ensure_installed = {},
    ignore_install = {},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
})

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
        { name = "nvim_lsp", keyword_length = 2 },
        { name = "buffer", keyword_length = 2 },
        { name = "path" },
        { name = "luasnip" },
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
require("mason-lspconfig").setup({
    automatic_enable = false,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

local util = require("lspconfig.util")
lspconfig.buf_ls.setup({
    root_dir = util.root_pattern("buf.work.yaml", "buf.gen.yaml", ".git"),
})
lspconfig.terraformls.setup({})
lspconfig.pyright.setup({
    capabilities = capabilities,
})
local get_root_dir = function(fname)
    return util.root_pattern(".git")(fname)
        or util.root_pattern("pnpm-workspace.yaml", "pnpm-lock.yaml")(fname)
        or util.root_pattern("package.json", "tsconfig.json")(fname)
end

lspconfig.tailwindcss.setup({})
lspconfig.sqlls.setup({})
lspconfig.jsonls.setup({})
lspconfig.prismals.setup({})
lspconfig.intelephense.setup({})
lspconfig.dockerls.setup({})
lspconfig.bashls.setup({})
lspconfig.taplo.setup({})
lspconfig.clangd.setup({})
lspconfig.denols.setup({
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})
lspconfig.ts_ls.setup({
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
        preferences = {
            importModuleSpecifierPreference = "non-relative",
        },
        maxTsServerMemory = "10240",
    },
    commands = {
        OrganizeImports = {
            function()
                local params = {
                    command = "_typescript.organizeImports",
                    arguments = { vim.api.nvim_buf_get_name(0) },
                    title = "",
                }
                vim.lsp.buf.execute_command(params)
            end,
            description = "Organize Imports",
        },
    },
})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = { enable = false },
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
        vim.keymap.set("n", "<localleader>gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<localleader>K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<localleader>fw", ":FormatWrite<cr>", opts)
        --local bufopts = { noremap=true, silent=true, buffer=bufnr }
        --vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        --vim.keymap.set('n', '<space>wl', function()
        --print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --end, bufopts)
        --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        --vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        --vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufop
    end,
})

local formatterUtil = require("formatter.util")

local formatter = require("formatter")
formatter.setup({
    logging = false,
    filetype = {
        prisma = require("formatter.defaults").prettier,
        markdown = require("formatter.filetypes.markdown").prettier,
        php = require("formatter.filetypes.php").php_cs_fixer,
        yaml = require("formatter.filetypes.yaml").prettier,
        css = require("formatter.filetypes.css").prettier,
        html = require("formatter.filetypes.html").prettier,
        graphql = require("formatter.filetypes.graphql").prettier,
        json = require("formatter.filetypes.json").prettier,
        jsonc = require("formatter.filetypes.json").prettier,
        python = require("formatter.filetypes.python").black,
        javascript = require("formatter.filetypes.javascript").prettier,
        javascriptreact = require("formatter.filetypes.javascriptreact").prettier,
        typescript = require("formatter.filetypes.typescript").prettier,
        typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
        c = require("formatter.filetypes.c").clangformat,
        cpp = require("formatter.filetypes.cpp").clangformat,
        ["proto"] = function()
            return {
                exe = "buf format",
                args = {
                    "-w",
                },
                stdin = false,
            }
        end,
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = {
                        "--indent-type Spaces",
                        "--search-parent-directories",
                        "--stdin-filepath",
                        formatterUtil.escape_path(formatterUtil.get_current_buffer_file_path()),
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
    callback = function()
        local file_path = vim.fn.expand("%:p")
        if vim.bo.filetype ~= "php" and not file_path:find("workspaces/orangefield/store.orangefield.co.kr") then
            vim.cmd(":FormatWrite")
        end
    end,
    group = formatGroup,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "Dockerfile*",
    command = "set filetype=dockerfile",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = ".swcrc",
    command = "set filetype=json",
})

require("ibl").setup()

require("Comment").setup({
    toggler = {
        line = "<localleader>cc",
        block = "<localleader>bc",
    },
    opleader = {
        line = "<localleader>cc",
        block = "<localleader>bc",
    },
})

vim.filetype.add({
    filename = {
        [".env"] = "sh",
    },
    pattern = {
        [".env.*"] = "sh",
    },
})
