return {
	"tpope/vim-fugitive",
	config = function()
		-- Git commands with proper context
		vim.keymap.set("n", "<leader>gs", "<CMD>Git<CR>", { desc = "Git status" })
		vim.keymap.set("n", "<leader>gc", "<CMD>Git commit -v<CR>", { desc = "Git commit" })
		vim.keymap.set("n", "<leader>gp", "<CMD>Git push<CR>", { desc = "Git push" })
		vim.keymap.set("n", "<leader>gP", "<CMD>Git pull<CR>", { desc = "Git pull" })

		-- Git restore - restore current file
		vim.keymap.set("n", "<leader>gr", "<CMD>Git restore %<CR>", { desc = "Git restore current file" })

		-- Git add - stage current file or all files
		vim.keymap.set("n", "<leader>ga", "<CMD>Git add %<CR>", { desc = "Git add current file" })
		vim.keymap.set("n", "<leader>gA", "<CMD>Git add .<CR>", { desc = "Git add all" })

		-- Git diff
		vim.keymap.set("n", "<leader>gd", "<CMD>Gdiffsplit<CR>", { desc = "Git diff current file" })

		-- Git log
		vim.keymap.set("n", "<leader>gl", "<CMD>Git log<CR>", { desc = "Git log" })
		vim.keymap.set("n", "<leader>gL", "<CMD>Git log --oneline --graph --all<CR>", { desc = "Git log graph" })

 	-- Git blame
 	vim.keymap.set("n", "<leader>gB", "<CMD>Git blame<CR>", { desc = "Git blame" })
 
 	-- Git checkout and branch
 	vim.keymap.set("n", "<leader>gm", "<CMD>Git checkout main<CR>", { desc = "Git checkout main" })
 	vim.keymap.set("n", "<leader>gb", function()
			local branch = vim.fn.input("Branch name: ")
			if branch ~= "" then
				vim.cmd("Git checkout " .. branch)
			end
		end, { desc = "Git checkout/create branch" })
	end,
}
