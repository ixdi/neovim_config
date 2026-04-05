vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = "main" },
})

require("nvim-treesitter").setup({
	-- incremental_selection = {
	-- enable = true,
	-- keymaps = {
	-- 	init_selection = "<Enter>", -- set to `false` to disable one of the mappings
	-- 	node_incremental = "<Enter>",
	-- 	scope_incremental = false,
	-- 	node_decremental = "<Backspace>",
	-- },
	-- },
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		-- Enable treesitter highlighting and disable regex syntax
		pcall(vim.treesitter.start)
		-- Enable treesitter-based indentation
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

local ensure_installed = {
	"bash",
	"c_sharp",
	"cmake",
	"comment",
	"css",
	"csv",
	"diff",
	"dockerfile",
	"git_config",
	"gitcommit",
	"gitignore",
	"glimmer",
	"graphql",
	"html",
	"http",
	"javascript",
	"jsdoc",
	"json",
	"json5",
	"latex",
	"lua",
	"markdown",
	"markdown_inline",
	"mermaid",
	"prisma",
	"python",
	"regex",
	"scss",
	"sql",
	"ssh_config",
	"terraform",
	"tmux",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"vue",
	"xml",
	"yaml",
}

require("nvim-treesitter").install(ensure_installed)
