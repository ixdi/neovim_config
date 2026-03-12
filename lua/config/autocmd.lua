-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if not client then
-- 			return
-- 		end
-- 		if client:supports_method("textDocument/completion") then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })

-- Package management commands
local function complete_packages()
	return vim.iter(vim.pack.get())
		:map(function(pack)
			return pack.spec.name
		end)
		:totable()
end

vim.api.nvim_create_user_command("PackUpdate", function(info)
	if #info.fargs ~= 0 then
		vim.pack.update(info.fargs, { force = info.bang })
	else
		vim.pack.update(nil, { force = info.bang })
	end
end, {
	desc = "Update packages",
	nargs = "*",
	bang = true,
	complete = complete_packages,
})

vim.api.nvim_create_user_command("PackDelete", function(info)
	vim.pack.del(info.fargs, { force = info.bang })
end, {
	desc = "Delete packages",
	nargs = "+",
	bang = true,
	complete = complete_packages,
})
