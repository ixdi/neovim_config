-- show indent lines
vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim", main = "ibl" },
})

require("ibl").setup({
	indent = { char = "│" },
	exclude = {
		filetypes = {
			"help",
			"dashboard",
			"nvim-tree",
			"mason",
			"notify",
			"ergoterm",
		},
	},
	scope = { enabled = false },
})
