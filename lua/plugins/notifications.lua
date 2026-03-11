vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.notify" },
})

require("mini.notify").setup({
	-- Animation style (see below)
	-- animation = { fade_in = 0, fade_out = 0, fps = 30, style = "fade" },
	-- Function to render a notification (see below)
	-- render = "default",
	timeout = 1500,
})

vim.keymap.set("n", "<leader>nh", function()
	require("mini.notify").show_history()
end, { desc = "MiniNotify History" })

vim.keymap.set("n", "<leader>na", function()
	require("mini.notify").get_all()
end, { desc = "MiniNotify Show All" })
