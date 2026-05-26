-- Formatting framework for Neovim

vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim", event = { "BufReadPre", "BufNewFile" } },
})

require("conform").setup({
	formatters_by_ft = {
		javascript = { "biome", "biome-organize-imports" },
		typescript = { "biome", "biome-organize-imports" },
		javascriptreact = { "biome", "biome-organize-imports" },
		typescriptreact = { "biome", "biome-organize-imports" },
		json = { "biome" },
		html = { "superhtml" },
		css = { "biome" },
		scss = { "biome" },
		markdown = { "prettierd" },
		yaml = { "prettierd" },
		lua = { "stylua" },
		graphql = { "prettierd" },
		python = { "black" },
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
