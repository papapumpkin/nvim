return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
	},
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")

		-- Leader key mappings
		wk.add({
			{ "<leader>f", group = "Find" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
			{ "<leader>fs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
			{ "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },

			{ "<leader>g", group = "Git" },
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Status" },
			{ "<leader>gc", "<cmd>Git commit -v<cr>", desc = "Commit" },
			{ "<leader>gp", "<cmd>Git push<cr>", desc = "Push" },
			{ "<leader>gP", "<cmd>Git pull<cr>", desc = "Pull" },
			{ "<leader>gr", "<cmd>Git restore %<cr>", desc = "Restore Current File" },
			{ "<leader>ga", "<cmd>Git add %<cr>", desc = "Add Current File" },
			{ "<leader>gA", "<cmd>Git add .<cr>", desc = "Add All Files" },
			{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Diff Current File" },
			{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
			{ "<leader>gl", "<cmd>Git log<cr>", desc = "Log" },
			{ "<leader>gL", "<cmd>Git log --oneline --graph --all<cr>", desc = "Log Graph" },
			{ "<leader>gcom", "<cmd>Git checkout main<cr>", desc = "Checkout Main" },
			{
				"<leader>gcob",
				function()
					local branch = vim.fn.input("Branch name: ")
					if branch ~= "" then
						vim.cmd("Git checkout " .. branch)
					end
				end,
				desc = "Checkout/Create Branch",
			},

			{ "<leader>a", group = "AI" },
			{ "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
			{ "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "New Chat" },
			{ "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Chat" },
			{ "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Inline Prompt" },
			{ "<leader>am", "<cmd>:MCPHub<CR>", desc = "Open MCP Hub" },

			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Neotree" },
			{ "<leader>r", "<cmd>NvimTreeFocus<cr>", desc = "Focus Neotree" },
			{ "<leader>w", "<cmd>update<cr>", desc = "Save" },
			{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
			{ "<leader>o", "<cmd>vsplit<cr>", desc = "Vertical Split" },
			{ "<leader>p", "<cmd>split<cr>", desc = "Horizontal Split" },
			{ "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
		})

		-- Visual mode mappings
		wk.add({
			{ "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to Chat", mode = "v" },
			{ "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Inline Prompt", mode = "v" },
			{ "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to Chat", mode = "v" },
			{ "<C-a>", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI Chat", mode = "v" },
		})

		-- Normal mode mappings
		wk.add({
			{ "<C-a>", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI Chat", mode = "n" },
			{ "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Quick Add to Chat", mode = "n" },
			{ "]d", "<cmd>CodeCompanion diff next<cr>", desc = "Next Diff", mode = "n" },
			{ "[d", "<cmd>CodeCompanion diff prev<cr>", desc = "Previous Diff", mode = "n" },
		})

		-- Substitute keymaps
		wk.add({
			{ "s", group = "Substitute operator", mode = "n" },
			{ "ss", group = "Substitute line", mode = "n" },
			{ "S", group = "Substitute to EOL", mode = "n" },
		})

		-- Leap motion keymaps
		wk.add({
			{ "<leader>s", desc = "Leap Forward", mode = { "n", "x", "o" } },
			{ "<leader>S", desc = "Leap Backward", mode = { "n", "x", "o" } },
			{ "<leader>ss", desc = "Leap From Window", mode = { "n", "x", "o" } },
		})

		-- Leap-spooky remote operations (magnetic mode)
		wk.add({
			{ "r", desc = "Remote (surrounding) operations", mode = { "o", "x" } },
		})
	end,
}
