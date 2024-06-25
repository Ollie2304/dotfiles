return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup
            {
                -- list of parsers to install, first 5 should always be installed
                ensure_installed = {"c", "lua", "vim", "vimdoc", "query",
                "markdown",
                "markdown_inline",
                "javascript",
                "c_sharp",
                "html",
                "css",
                "python",
                "hyprlang",
            },
            -- install missing parsers when entering a buffer
            auto_install = true,

            -- install parsers synchronously
            sync_install = false,

            ignore_install = {},

            -- enable highlighting
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },


            indent = { enabled = true },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Leader>ss",
                    node_incremental = "<Leader>si",
                    scope_incremental = "<Leader>sS",
                    node_decremental = "<Leader>sd",
                },
            },
            textobjects = {
                select = {
                    enable = true,

                    lookahead = true,

                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        ['@class.outer'] = '<c-q>', -- blockwise
                    },
                    include_surrounding_whitespace = true,
                },
            },
            vim.filetype.add({
                pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
            })
        }
    end,
},
{
    "nvim-treesitter/nvim-treesitter-textobjects",
},
}
