return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap-python",
    },
    config = function ()

        require('dap-python').setup()

        local dap, ui = require('dap'), require('dapui')

        ui.setup()

        vim.keymap.set('n', "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set('n', "<F1>", dap.continue)
        vim.keymap.set('n', "<F2>", dap.step_over)
        vim.keymap.set('n', "<F3>", dap.step_into)
        vim.keymap.set('n', "<F4>", dap.step_out)

        dap.listeners.after.event_initialized["dapui_config"] = function()
            ui.open()
        end
        dap.listeners.before.event_initialized["dapui_config"] = function()
            ui.open()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            ui.open()
        end

    end
}