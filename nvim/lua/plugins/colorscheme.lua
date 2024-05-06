return {
    "devoc09/lflops.nvim",
    config = function()
        -- colorscheme
        vim.opt.background = "dark"
        vim.cmd("colorscheme lflops")
    end,
}

-- if development in local
-- return {
--   dir = '/home/kumico/go/src/github.com/devoc09/lflops.nvim',
--   config = function()
--     vim.cmd('')
--   end,
-- }
