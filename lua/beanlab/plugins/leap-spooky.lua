return {
	"ggandor/leap-spooky.nvim",
	dependencies = {
		{ url = "https://codeberg.org/andyg/leap.nvim", name = "leap.nvim" },
	},
	config = function()
		require("leap-spooky").setup({
			-- Additional paste/yank operations can be made on surrounding objects
			-- without moving the cursor.
			affixes = {
				-- These operations will be available as "ir" and "ar" (inside/around)
				magnetic = { window = "r", cross_window = "R" },
			},
			-- Paste behavior
			paste_on_remote_yank = false,
		})
	end,
}
