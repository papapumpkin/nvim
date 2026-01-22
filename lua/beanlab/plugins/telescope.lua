return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"dist/",
					"build/",
					"target/",
					"%.lock",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})
		-- Keymaps are defined in lua/beanlab/maps.lua
	end,
}
