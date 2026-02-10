-- Auto-reload buffers when files change externally (e.g., from Claude Code)
return {
  "neovim/nvim-lspconfig", -- Dummy dependency, this is just autocmd config
  config = function()
    -- Enable autoread
    vim.opt.autoread = true

    -- Track buffers we should ignore (modified or special buffers)
    local function should_reload_buffer(bufnr)
      -- Don't reload if buffer is modified
      if vim.bo[bufnr].modified then
        return false
      end

      -- Don't reload special buffers
      local buftype = vim.bo[bufnr].buftype
      if buftype ~= "" then
        return false
      end

      -- Don't reload certain filetypes (diffview panels, etc.)
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

    -- Reload visible buffers in the current tab
    local function reload_visible_buffers()
      -- Get all windows in the current tab
      local windows = vim.api.nvim_tabpage_list_wins(0)

      for _, win in ipairs(windows) do
        local bufnr = vim.api.nvim_win_get_buf(win)

        if should_reload_buffer(bufnr) then
          -- Check if file has changed on disk
          vim.api.nvim_buf_call(bufnr, function()
            vim.cmd("checktime")
          end)
        end
      end
    end

    -- Set up autocmds for various events
    local group = vim.api.nvim_create_augroup("HotReload", { clear = true })

    -- Reload on focus and cursor events
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

    -- Watch filesystem for changes in current working directory
    local watcher = require("beanlab.utils.directory-watcher")
    local debounce_timer = nil
    local debounce_ms = 100 -- Wait 100ms after last change before reloading

    -- Watch the current working directory
    watcher.watch(vim.loop.cwd(), function(change)
      -- Ignore .git directory changes (those are handled by diffview reload)
      if change.filename and change.filename:match("^%.git") then
        return
      end

      -- Debounce: wait for changes to settle before reloading
      if debounce_timer then
        debounce_timer:stop()
      end

      debounce_timer = vim.loop.new_timer()
      debounce_timer:start(debounce_ms, 0, vim.schedule_wrap(function()
        reload_visible_buffers()
        debounce_timer = nil
      end))
    end, { recursive = true })

    -- Clean up on exit
    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = group,
      callback = function()
        watcher.unwatch_all()
      end,
    })
  end,
}
