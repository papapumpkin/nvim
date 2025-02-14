return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			-- Your existing commands organized nicely
			f = {
				name = "Find",
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				g = { "<cmd>Telescope live_grep<cr>", "Find Text" },
				b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
				s = { "<cmd>Telescope git_status<cr>", "Git Status" },
				c = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
			},
			e = { "<cmd>NvimTreeToggle<cr>", "Toggle Neotree" },
			r = { "<cmd>NvimTreeFocus<cr>", "Focus Neotree" },
			w = { "<cmd>update<cr>", "Save" },
			q = { "<cmd>q<cr>", "Quit" },
			o = { "<cmd>vsplit<cr>", "Vertical Split" },
			p = { "<cmd>split<cr>", "Horizontal Split" },
			t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
		}, { prefix = "<leader>" })
	end,
}
