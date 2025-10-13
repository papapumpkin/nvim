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

			{ "<leader>a", group = "AI" },
			{ "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Chat" },

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
			{ "<C-a>", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions", mode = "v" },
			{ "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to Chat", mode = "v" },
		})

		-- Normal mode mappings
		wk.add({
			{ "<C-a>", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions", mode = "n" },
		})

		-- Substitute keymaps
		wk.add({
			{ "s", group = "Substitute operator", mode = "n" },
			{ "ss", group = "Substitute line", mode = "n" },
			{ "S", group = "Substitute to EOL", mode = "n" },
		})
	end,
}
