-- snippets

vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

require("luasnip").setup({
	history = true,
	delete_check_events = "TextChanged",
})

local hooks = function(ev)
	-- Use available |event-data|
	local name, kind = ev.data.spec.name, ev.data.kind
	-- Run build script after plugin's code has changed
	if name == "luasnip" and (kind == "install" or kind == "update") then
		-- Append `:wait()` if you need synchronous execution
		vim.system({ "make install_jsregexp" }, { cwd = ev.data.path })
	end
end

vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })
