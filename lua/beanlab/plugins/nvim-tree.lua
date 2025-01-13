-- ~/nvim/lua/beanlab/plugins/nvim-tree.lua

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
            },
            filters = {
                dotfiles = false,
            },
        })
        
        -- Set keymaps for opening/closing tree
        vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {silent = true})
        -- or use <leader>e if you prefer
        -- vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {silent = true})
    end
}
