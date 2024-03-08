return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				rust = require("formatter.filetypes.rust").rustfmt,
				go = require("formatter.filetypes.go").gofmt,
				lua = require("formatter.filetypes.lua").stylua,
				python = require("formatter.filetypes.python").ruff,
				svelte = require("formatter.filetypes.svelte").prettier,
				typescript = require("formatter.filetypes.typescript").prettier,
				json = require("formatter.filetypes.json").prettier,
			},
		})

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end,
}
