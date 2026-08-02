-- Directory watcher using Neovim's native uv fs_event API
-- Watches for file changes in the current working directory

local M = {}

local watchers = {}

-- Start watching a directory for changes.
-- Accepts (path, opts, callback) or (path, callback, opts) — order-independent
-- by type, since this call site has drifted out of sync with this signature twice.
function M.watch(path, a, b)
  local opts, callback
  if type(a) == "function" then
    callback, opts = a, b
  else
    opts, callback = a, b
  end
  opts = opts or {}

  if type(callback) ~= "function" then
    vim.notify("directory-watcher.watch: missing callback function", vim.log.levels.ERROR)
    return nil
  end

  local handle = vim.loop.new_fs_event()
  if not handle then
    vim.notify("Failed to create fs_event handle", vim.log.levels.ERROR)
    return nil
  end

  local function on_change(err, filename, events)
    if err then
      vim.notify("Directory watcher error: " .. err, vim.log.levels.ERROR)
      return
    end

    -- Call the callback with change info
    callback({
      filename = filename,
      events = events,
      path = path,
    })
  end

  -- Start watching (recursive flag watches subdirectories)
  local ok, err = pcall(function()
    handle:start(path, { recursive = opts.recursive or false }, vim.schedule_wrap(on_change))
  end)

  if not ok then
    vim.notify("Failed to start watching " .. path .. ": " .. tostring(err), vim.log.levels.WARN)
    handle:close()
    return nil
  end

  -- Store the watcher
  local watcher_id = #watchers + 1
  watchers[watcher_id] = handle

  return watcher_id
end

-- Stop watching a directory
function M.unwatch(watcher_id)
  local handle = watchers[watcher_id]
  if handle then
    handle:stop()
    handle:close()
    watchers[watcher_id] = nil
  end
end

-- Stop all watchers
function M.unwatch_all()
  for id, handle in pairs(watchers) do
    handle:stop()
    handle:close()
  end
  watchers = {}
end

return M
