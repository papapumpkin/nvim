-- ~/nvim/lua/beanlab/plugins/colorscheme.lua

return {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme tokyodark")
    end,
}

