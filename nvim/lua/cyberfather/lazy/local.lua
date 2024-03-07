return {
    {
        dependencies = { "nvim-telescope/telescope.nvim" },
        dir = "~/personal/license-nvim",
        config = function()
            local license = require("license")
            license.setup("CyberFatherRT")

            vim.keymap.set("n", "<leader>gl", function() license.paste_license() end)
        end
    },
    {
        dir = "~/personal/rfc.nvim",
        config = function()
            local rfc = require("rfc")
            rfc.setup({
                rfc_dir = "/home/godfather/.local/share/nvim/rfc.nvim",
            })

            vim.keymap.set("n", "<leader>rf", function() rfc.list_rfcs() end)
        end
    }
}
