return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night", -- storm, moon, night, day — "night" matches Ghostty's plain "TokyoNight" theme
			transparent = false,
			on_highlights = function(hl, c)
				-- `return` defaults to the same purple/magenta family as if/for — too close to
				-- read as intentional. Give it a distinct, deliberate color instead.
				hl["@keyword.return"] = { fg = c.orange, bold = true }
			end,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
