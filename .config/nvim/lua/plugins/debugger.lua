return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim"

    },
    config = function ()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup{
            automatic_installation = true,
            handlers = {},
        }
        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {desc = "Debug: Toggle Breakpoint"})
        vim.keymap.set("n", "<Leader>dc", dap.continue, {desc = "Debug: Start/Continue"})
        vim.keymap.set("n", "<Leader>ds", dap.step_over, {desc = "Debug: Step Over"})
        vim.keymap.set("n", "<Leader>di", dap.step_into, {desc = "Debug: Step Into"})
        vim.keymap.set("n", "<Leader>do", dap.step_out, {desc = "Debug: Step Out"})

        require("dapui").setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }

        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }

    end
}
