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
					keymaps = {
						next_chat = {
							modes = { n = "]]" },
							index = 8,
							callback = "keymaps.next_chat",
							description = "Next chat",
						},
						previous_chat = {
							modes = { n = "[[" },
							index = 9,
							callback = "keymaps.previous_chat",
							description = "Previous chat",
						},
						close = {
							modes = { n = "q" },
							index = 10,
							callback = "keymaps.close",
							description = "Close chat",
						},
					},
				},
				inline = {
					adapter = "anthropic",
					keymaps = {
						next_change = {
							modes = { n = "]d" },
							index = 1,
							callback = "keymaps.next_change",
							description = "Move to next change",
						},
						prev_change = {
							modes = { n = "[d" },
							index = 2,
							callback = "keymaps.prev_change",
							description = "Move to previous change",
						},
						reject_and_close = {
							modes = { n = "<Esc>" },
							index = 3,
							callback = "keymaps.reject_change",
							description = "Reject change and close diff",
						},
					},
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
