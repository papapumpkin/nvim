return {
	"tiagovla/tokyodark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.cmd("colorscheme tokyodark")
	end,
}
