return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
		"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
		"ravitemer/mcphub.nvim",
		{ "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
	},
	config = function()
		require("codecompanion").setup({
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true,
						make_slash_commands = true,
						show_result_in_chat = true,
					},
				},
			},
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
				agent = {
					adapter = "anthropic",
				},
			},
			adapters = {
				http = {
					anthropic = function()
						return require("codecompanion.adapters").extend("anthropic", {
							env = {
								api_key = "AVANTE_ANTHROPIC_API_KEY",
							},
							schema = {
								model = {
									default = "claude-sonnet-4-5-20250929",
								},
							},
						})
					end,
				},
			},
		})
	end,
}
