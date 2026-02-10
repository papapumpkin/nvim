return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local diffview = require("diffview")
		diffview.setup({
			diff_binaries = false,
			enhanced_diff_hl = false,
			git_cmd = { "git" },
			use_icons = true,
			watch_index = true,
			icons = {
				folder_closed = "",
				folder_open = "",
			},
			signs = {
				fold_closed = "",
				fold_open = "",
				done = "✓",
			},
			view = {
				default = {
					layout = "diff2_horizontal",
				},
				merge_tool = {
					layout = "diff3_horizontal",
					disable_diagnostics = true,
				},
				file_history = {
					layout = "diff2_horizontal",
				},
			},
			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
				},
			},
			file_history_panel = {
				log_options = {
					git = {
						single_file = {
							diff_merges = "combined",
						},
						multi_file = {
							diff_merges = "first-parent",
						},
					},
				},
				win_config = {
					position = "bottom",
					height = 16,
				},
			},
			commit_log_panel = {
				win_config = {},
			},
			default_args = {
				DiffviewOpen = {},
				DiffviewFileHistory = {},
			},
			hooks = {},
			keymaps = {
				disable_defaults = false,
				view = {
					["<tab>"] = require("diffview.actions").select_next_entry,
					["<s-tab>"] = require("diffview.actions").select_prev_entry,
					["gf"] = require("diffview.actions").goto_file,
					["<C-w><C-f>"] = require("diffview.actions").goto_file_split,
					["<C-w>gf"] = require("diffview.actions").goto_file_tab,
					["<leader>e"] = require("diffview.actions").focus_files,
					["<leader>b"] = require("diffview.actions").toggle_files,
				},
				file_panel = {
					["j"] = require("diffview.actions").next_entry,
					["<down>"] = require("diffview.actions").next_entry,
					["k"] = require("diffview.actions").prev_entry,
					["<up>"] = require("diffview.actions").prev_entry,
					["<cr>"] = require("diffview.actions").select_entry,
					["o"] = require("diffview.actions").select_entry,
					["<2-LeftMouse>"] = require("diffview.actions").select_entry,
					["-"] = require("diffview.actions").toggle_stage_entry,
					["S"] = require("diffview.actions").stage_all,
					["U"] = require("diffview.actions").unstage_all,
					["X"] = require("diffview.actions").restore_entry,
					["R"] = require("diffview.actions").refresh_files,
					["<tab>"] = require("diffview.actions").select_next_entry,
					["<s-tab>"] = require("diffview.actions").select_prev_entry,
					["gf"] = require("diffview.actions").goto_file,
					["<C-w><C-f>"] = require("diffview.actions").goto_file_split,
					["<C-w>gf"] = require("diffview.actions").goto_file_tab,
					["i"] = require("diffview.actions").listing_style,
					["f"] = require("diffview.actions").toggle_flatten_dirs,
					["<leader>e"] = require("diffview.actions").focus_files,
					["<leader>b"] = require("diffview.actions").toggle_files,
				},
				file_history_panel = {
					["g!"] = require("diffview.actions").options,
					["<C-A-d>"] = require("diffview.actions").open_in_diffview,
					["y"] = require("diffview.actions").copy_hash,
					["L"] = require("diffview.actions").open_commit_log,
					["zR"] = require("diffview.actions").open_all_folds,
					["zM"] = require("diffview.actions").close_all_folds,
					["j"] = require("diffview.actions").next_entry,
					["<down>"] = require("diffview.actions").next_entry,
					["k"] = require("diffview.actions").prev_entry,
					["<up>"] = require("diffview.actions").prev_entry,
					["<cr>"] = require("diffview.actions").select_entry,
					["o"] = require("diffview.actions").select_entry,
					["<2-LeftMouse>"] = require("diffview.actions").select_entry,
					["<tab>"] = require("diffview.actions").select_next_entry,
					["<s-tab>"] = require("diffview.actions").select_prev_entry,
					["gf"] = require("diffview.actions").goto_file,
					["<C-w><C-f>"] = require("diffview.actions").goto_file_split,
					["<C-w>gf"] = require("diffview.actions").goto_file_tab,
					["<leader>e"] = require("diffview.actions").focus_files,
					["<leader>b"] = require("diffview.actions").toggle_files,
				},
				option_panel = {
					["<tab>"] = require("diffview.actions").select_entry,
					["q"] = require("diffview.actions").close,
				},
			},
		})
	end,
}
