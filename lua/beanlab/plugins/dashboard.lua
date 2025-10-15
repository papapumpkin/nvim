return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		-- Calculate countdown to 5pm
		local function get_countdown_to_5pm()
			local current_time = os.time()
			local date_table = os.date("*t", current_time)

			-- Set target time to 5pm today
			local target = os.time({
				year = date_table.year,
				month = date_table.month,
				day = date_table.day,
				hour = 17,
				min = 0,
				sec = 0,
			})

			-- If current time is past 5pm, target tomorrow's 5pm
			if current_time > target then
				target = target + 86400 -- Add 24 hours in seconds
			end

			local diff = target - current_time
			local hours = math.floor(diff / 3600)
			local minutes = math.floor((diff % 3600) / 60)

			return string.format("(%dh %dm until 5pm)", hours, minutes)
		end

		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "letter",
			change_to_vcs_root = false,
			config = {
				week_header = {
					enable = true,
				},
				packages = { enable = false },
				project = { enable = true, limit = 8 },
				mru = { limit = 10 },
				footer = {
					"",
					os.date("%Y-%m-%d %H:%M:%S") .. " minä rakastan olutta " .. get_countdown_to_5pm(),
					"",
				},
			},
			hide = {
				statusline = false,
				tabline = false,
				winbar = false,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
