vim.pack.add({
	{ src = "https://codeberg.org/andyg/leap.nvim.git" },
})

vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap)")
vim.keymap.set("n", "<leader>S", "<Plug>(leap-from-window)")
