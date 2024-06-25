return
{
    {
    "m4xshen/autoclose.nvim",
    config = function()
        require("autoclose").setup({})
    end
},
{
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function ()
        require("nvim-surround").setup({

        })
    end
},
{
    "windwp/nvim-ts-autotag",
    config = function ()
    require("nvim-ts-autotag").setup({
        opts = {}
    })
    end
}
}
