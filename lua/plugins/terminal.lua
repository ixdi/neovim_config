-- Modern terminal management plugin for Neovim
vim.pack.add({
	{ src = "https://github.com/waiting-for-dev/toggleterm.nvim", branch = "waiting-for-dev/wop" },
})

require("toggleterm").setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "rounded",
	},
})

vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
vim.keymap.set("n", "<leader>tl", "<cmd>ToggleTermSendCurrentLine <T_ID><cr>", { desc = "Toggle Send Current Line" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTermSendVisualLines <T_ID><cr>", { desc = "Toggle Send Visual Lines" })
