vim.pack.add({ "https://github.com/nvim-mini/mini.files" })

require("mini.files").setup(
	-- No need to copy this inside `setup()`. Will be used automatically.
	{
		-- Customization of shown content
		content = {
			-- Predicate for which file system entries to show
			filter = nil,
			-- Highlight group to use for a file system entry
			highlight = nil,
			-- Prefix text and highlight to show to the left of file system entry
			prefix = nil,
			-- Order in which to show file system entries
			sort = nil,
		},

		-- Module mappings created only inside explorer.
		-- Use `''` (empty string) to not create one.
		mappings = {
			close = "<esc>",
			go_in = "L",
			go_in_plus = "l",
			go_out = "H",
			go_out_plus = "h",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},

		-- General options
		options = {
			-- Whether to delete permanently or move into module-specific trash
			permanent_delete = true,
			-- Whether to use for editing directories
			use_as_default_explorer = true,
			-- Timeout for synchronous LSP integration requests
			lsp_timeout = 1000,
		},

		-- Customization of explorer windows
		windows = {
			-- Maximum number of windows to show side by side
			max_number = math.huge,
			-- Whether to show preview of file/directory under cursor
			preview = false,
			-- Width of focused window
			width_focus = 50,
			-- Width of non-focused window
			width_nofocus = 15,
			-- Width of preview window
			width_preview = 25,
		},
	}
)

vim.api.nvim_set_keymap(
	"n",
	"ee",
	"<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
	{ noremap = true, silent = true }
)

-- Helper function to map keys for splitting
local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		-- Make new window and set it as target
		local cur_target = MiniFiles.get_explorer_state().target_window
		local new_target = vim.api.nvim_win_call(cur_target, function()
			vim.cmd(direction .. " split")
			return vim.api.nvim_get_current_win()
		end)

		MiniFiles.set_target_window(new_target)

		-- This intentionally doesn't act on file under cursor in favor of
		-- explicit "go in" action (`l` / `L`). To immediately open file,
		-- add appropriate `MiniFiles.go_in()` call instead of this comment.
		MiniFiles.go_in({ close_on_file = true })
	end

	-- Adding `desc` will result into `show_help` entries
	local desc = "Split " .. direction
	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

-- Show dotfiles in explorer
local show_dotfiles = true

local filter_show = function(fs_entry)
	return true
end

local filter_hide = function(fs_entry)
	return not vim.startswith(fs_entry.name, ".")
end

local toggle_dotfiles = function()
	show_dotfiles = not show_dotfiles
	local new_filter = show_dotfiles and filter_show or filter_hide
	MiniFiles.refresh({ content = { filter = new_filter } })
end

-- Set initial filter
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		-- Tweak keys to your liking
		map_split(buf_id, "-", "belowright horizontal")
		map_split(buf_id, "+", "belowright vertical")
		map_split(buf_id, "t", "tab")
		vim.keymap.set("n", "<S-i>", toggle_dotfiles, { buffer = buf_id })
	end,
})
