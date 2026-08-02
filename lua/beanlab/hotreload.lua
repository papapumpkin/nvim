-- Auto-reload buffers when files change externally (e.g., from Claude Code)
local M = {}

function M.setup()
	vim.opt.autoread = true

	local function should_reload_buffer(bufnr)
		if vim.bo[bufnr].modified then
			return false
		end

		local buftype = vim.bo[bufnr].buftype
		if buftype ~= "" then
			return false
		end

		local ignore_filetypes = {
			"DiffviewFiles",
			"DiffviewFileHistory",
			"fugitive",
			"gitcommit",
		}

		local filetype = vim.bo[bufnr].filetype
		for _, ft in ipairs(ignore_filetypes) do
			if filetype == ft then
				return false
			end
		end

		return true
	end

	local function reload_visible_buffers()
		local windows = vim.api.nvim_tabpage_list_wins(0)

		for _, win in ipairs(windows) do
			local bufnr = vim.api.nvim_win_get_buf(win)

			if should_reload_buffer(bufnr) then
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("checktime")
				end)
			end
		end
	end

	local group = vim.api.nvim_create_augroup("HotReload", { clear = true })

	vim.api.nvim_create_autocmd({
		"FocusGained",
		"TermLeave",
		"BufEnter",
		"WinEnter",
		"CursorHold",
		"CursorHoldI",
	}, {
		group = group,
		callback = function()
			reload_visible_buffers()
		end,
	})

	local watcher = require("beanlab.utils.directory-watcher")
	local debounce_timer = nil
	local debounce_ms = 100

	watcher.watch(vim.loop.cwd(), function(change)
		if change.filename and change.filename:match("^%.git") then
			return
		end

		if debounce_timer then
			debounce_timer:stop()
		end

		debounce_timer = vim.loop.new_timer()
		debounce_timer:start(
			debounce_ms,
			0,
			vim.schedule_wrap(function()
				reload_visible_buffers()
				debounce_timer = nil
			end)
		)
	end, { recursive = true })

	vim.api.nvim_create_autocmd("VimLeavePre", {
		group = group,
		callback = function()
			watcher.unwatch_all()
		end,
	})
end

return M
