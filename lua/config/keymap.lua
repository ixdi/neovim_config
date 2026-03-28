-- Diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.jump or vim.diagnostic.jump
	local count = next and 1 or -1
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ count = count, severity = severity })
	end
end

-- Blazingly fast way out of insert mode
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<Space><Space>", vim.lsp.buf.hover, { desc = "Hover" })

-- Quick access to some common actions
vim.keymap.set("n", ",w", "<cmd>w<cr>", { desc = "Write" })
vim.keymap.set("n", ",qq", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", ",qa", "<cmd>qa!<cr>", { desc = "Quit all" })

-- Diagnostic keymaps
-- These GLOBAL keymaps are created unconditionally when Nvim starts:
-- "gra" (Normal and Visual mode) is mapped to vim.lsp.buf.code_action()
-- "gri" is mapped to vim.lsp.buf.implementation()
-- "grn" is mapped to vim.lsp.buf.rename()
-- "grr" is mapped to vim.lsp.buf.references()
-- "grt" is mapped to vim.lsp.buf.type_definition()
-- "gO" is mapped to vim.lsp.buf.document_symbol()
-- CTRL-S (Insert mode) is mapped to vim.lsp.buf.signature_help()
-- v_an and v_in fall back to LSP vim.lsp.buf.selection_range() if treesitter is not active.
-- gx handles textDocument/documentLink. Example: with gopls, invoking gx on "os" in this Go code will open documentation externally:
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
vim.keymap.set("n", "<leader>en", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>ep", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code Actions " })

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Prev buffer" })

-- Stay in indent mode after indenting a selection in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })

-- Clear after search
vim.keymap.set("n", ",m", "<cmd>nohl<cr>", { desc = "Clear highlights" })

-- Update plugins via vim.pack
vim.keymap.set("n", "<leader>pu", function()
	vim.pack.update()
	vim.cmd("MasonUpdateAll")
	vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
	---@diagnostic disable-next-line: param-type-mismatch
	local ok = pcall(vim.cmd, "TSUpdate")
	if not ok then
		vim.notify("Failed to run TSUpdate after nvim-treesitter update", vim.log.levels.WARN)
	end
end, { desc = "Update plugins" })
