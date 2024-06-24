return
{

    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover,{})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition,{})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,{})
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            _G.lsp_capabilities = capabilities
        end
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"mason.nvim"},
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls"}
            })
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    { -- optional completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
}

