require("beanlab.settings")
require("beanlab.maps")
require("beanlab.lazy")

-- Configure LSP diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = 'always',  -- Show source of diagnostic
    border = 'rounded',
  },
})

-- Show diagnostics in floating window on cursor hold
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Optional: adjust how long to wait before showing (default is 4000ms)
vim.opt.updatetime = 300
