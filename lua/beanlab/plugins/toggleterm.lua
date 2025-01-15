return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 8,
			open_mapping = [[<F7>]],
			shading_factor = 2,
			direction = "horizontal",
			float_opts = {
				border = "curved",
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end,
}
