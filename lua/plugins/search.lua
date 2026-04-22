vim.pack.add({
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },
})

require("grug-far").setup({})

vim.keymap.set("n", "<Space>fr", ":GrupFar<cr>", { desc = "Replace in files (Spectre)" })
