return {
	"pwntester/octo.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("octo").setup({ enable_builtins = true })
		vim.cmd([[hi OctoEditable guibg=none]])
	end,
	keys = {
		{ "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
	},
}
