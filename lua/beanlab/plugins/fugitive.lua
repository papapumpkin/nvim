return {
	"tpope/vim-fugitive",
	config = function()
		-- Git commands
		vim.keymap.set("n", "<leader>gs", ":Git<CR>") -- git status
		vim.keymap.set("n", "<leader>gc", ":Git commit<CR>") -- git commit
		vim.keymap.set("n", "<leader>gp", ":Git push<CR>") -- git push
		vim.keymap.set("n", "<leader>gr", ":Git restore<CR>") -- git restore
		vim.keymap.set("n", "<leader>gt", ":Git tag<CR>") -- git tag
	end,
}
