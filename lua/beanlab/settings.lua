-- ~/nvim/lua/beanlab/settings.lua

local global = vim.g
local o = vim.opt

-- Editor options

o.number = true -- Print the line number in front of each line
o.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
o.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.
o.syntax = "on" -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.cursorline = true -- Highlight the screen line of the cursor (horizontal bar).
o.cursorcolumn = true -- Highlight the screen column of the cursor (vertical bar).
o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
o.encoding = "UTF-8" -- Sets the character encoding used inside Vim.
o.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
o.title = true -- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
o.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
o.splitright = true
o.splitbelow = true -- When on, splitting a window will put the new window below the current one

-- Window behavior
o.equalalways = false -- Don't automatically resize windows to be equal size
o.winminwidth = 5 -- Minimum width for a window (prevents making windows too small)
o.winminheight = 1 -- Minimum height for a window

o.termguicolors = true

-- Search
o.ignorecase = true -- Ignore case in search patterns...
o.smartcase = true -- ...unless the pattern contains an uppercase letter.
o.hlsearch = true -- Highlight all matches of the last search.
o.incsearch = true -- Show matches incrementally as you type.

-- UX / editing
o.scrolloff = 8 -- Keep 8 lines of context above/below the cursor.
o.sidescrolloff = 8 -- Same, horizontally.
o.signcolumn = "yes" -- Always show the sign column so text doesn't shift.
o.smartindent = true -- Smarter autoindent for new lines.
o.wrap = false -- Don't wrap long lines (matches your vim setup).
o.confirm = true -- Ask to save instead of failing on :q with unsaved changes.

-- Files: no swap/backup, but keep persistent undo across sessions
o.swapfile = false
o.backup = false
o.undofile = true

-- Only show the cursor crosshair in the active window (from your .vimrc)
local cursor_grp = vim.api.nvim_create_augroup("CursorCrosshair", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = cursor_grp,
	callback = function()
		vim.wo.cursorline = true
		vim.wo.cursorcolumn = true
	end,
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
	group = cursor_grp,
	callback = function()
		vim.wo.cursorline = false
		vim.wo.cursorcolumn = false
	end,
})
