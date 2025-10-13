return {
	"ggandor/leap.nvim",
	dependencies = {
		"tpope/vim-repeat",
	},
	config = function()
		local leap = require("leap")

		-- Customize leap appearance
		leap.opts.case_sensitive = false
		leap.opts.equivalence_classes = { " \t\r\n" }

		-- Highlight settings
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
		vim.api.nvim_set_hl(0, "LeapMatch", {
			fg = "white",
			bold = true,
			nocombine = true,
		})

		-- Custom keymaps using leader key
		vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward)", { desc = "Leap forward" })
		vim.keymap.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward)", { desc = "Leap backward" })
		vim.keymap.set({ "n", "x", "o" }, "<leader>ss", "<Plug>(leap-from-window)", { desc = "Leap from window" })
	end,
}
