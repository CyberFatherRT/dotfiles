return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()

        vim.api.nvim_create_user_command("StartChatGPT", function ()
            local home = vim.fn.expand("$HOME")
            require("chatgpt").setup({
                api_key_cmd = "gpg --decrypt " .. home .. "/.password-store/chatgpt/token.gpg",
            })

            vim.keymap.set("n", "<leader>cg", "<cmd>ChatGPT<CR>")
        end, {})

    end,
}
