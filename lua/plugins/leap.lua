-- Leap.nvim: a motion plugin that allows you to quickly jump to any location in the visible buffer using a two-character search.
vim.pack.add({
	{ src = "https://codeberg.org/andyg/leap.nvim.git" },
})

vim.keymap.set({ "n", "x", "o" }, "<leader>ss", "<Plug>(leap)")
vim.keymap.set("n", "<leader>SS", "<Plug>(leap-from-window)")
