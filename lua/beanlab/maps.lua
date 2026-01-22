vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Tab Management
map("n", "<leader>tn", "<CMD>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>to", "<CMD>tabonly<CR>", { desc = "Close all other tabs" })

-- Tab Navigation
map("n", "<leader>tj", "<CMD>tabnext<CR>", { desc = "Go to next tab" })
map("n", "<leader>tk", "<CMD>tabprevious<CR>", { desc = "Go to previous tab" })
map("n", "<Tab>", "<CMD>tabnext<CR>", { desc = "Go to next tab" })
map("n", "<S-Tab>", "<CMD>tabprevious<CR>", { desc = "Go to previous tab" })

-- Move current tab
map("n", "<leader>tmp", "<CMD>-tabmove<CR>", { desc = "Move tab to the left" })
map("n", "<leader>tmn", "<CMD>+tabmove<CR>", { desc = "Move tab to the right" })

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Fuzzy find opened files" })
map("n", "<leader>fs", "<CMD>Telescope git_status<CR>", { desc = "Show git file diffs" })
map("n", "<leader>fc", "<CMD>Telescope git_commits<CR>", { desc = "Browse git commits" })

-- Terminal
map("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Open terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Claude Code
map("n", "<C-a>", "<CMD>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
map("n", "<LocalLeader>a", "<CMD>ClaudeCodeFocus<CR>", { desc = "Focus Claude Code" })
map("v", "<LocalLeader>a", "<CMD>ClaudeCodeSend<CR>", { desc = "Send selection to Claude" })

-- Substitute
map("n", "s", function()
	return require("substitute").operator()
end, { expr = true, desc = "Substitute operator" })
map("n", "ss", function()
	return require("substitute").line()
end, { expr = true, desc = "Substitute line" })
map("n", "S", function()
	return require("substitute").eol()
end, { expr = true, desc = "Substitute to end of line" })
map("x", "s", function()
	return require("substitute").visual()
end, { expr = true, desc = "Substitute visual" })
