-- Modern terminal management plugin for Neovim
vim.pack.add({
	{ src = "https://github.com/waiting-for-dev/ergoterm.nvim" },
})

require("ergoterm").setup({
	terminal_defaults = {
		layout = "below",
		cleanup_on_success = false,
		auto_scroll = true,
		size = {
			below = 20,
		},
		float_opts = {
			border = "rounded",
		},
	},
	picker = {
		picker = "telescope",
		extra_select_actions = {
			["<C-d>"] = {
				fn = function(term)
					term:cleanup()
				end,
				desc = "Delete terminal",
			},
			["<C-x>"] = {
				fn = function(term)
					term:close()
				end,
				desc = "Close terminal",
			},
		},
	},
})

vim.keymap.set("n", "<leader>tt", ":TermNew<cr>", { desc = "New Terminal", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tp", ":TermSelect<cr>", { desc = "Pick Terminal" })
vim.keymap.set({ "n", "x" }, "<leader>ts", ":TermSend! new_line=false<cr>", { desc = "Send to last terminal" })
