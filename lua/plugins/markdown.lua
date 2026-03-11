-- NOTE: you must go to ~/.local/share/nvim/lazy/markdown-preview.nvim/
-- then update the package.json @node/type to the right version of your system node

vim.pack.add({
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

require("live-preview").setup()

vim.keymap.set("n", "<leader>md", ":LivePreview start<cr>", { desc = "Markdown preview" })

-- render-markdown.nvim is a plugin that uses treesitter to render markdown in a floating window

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("render-markdown").setup({
	latex = {
		enabled = false,
	},
}) -- only mandatory if you want to set custom options

vim.keymap.set("n", "<leader>mv", function()
	require("render-markdown").toggle()
end, { desc = "Markdown preview" })
