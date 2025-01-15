-- ~/nvim/lua/beanlab/plugins/toggleterm.lua

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 10,
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
