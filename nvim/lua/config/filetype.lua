vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "python" },
  callback = function()
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vim", "lua" },
  callback = function()
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
