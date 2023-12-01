return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    cmd = "NvimTreeOpen",
    keys = {
        {"sf", "<cmd>NvimTreeOpen<cr>" },
    },
    config = function()
        local gheight = vim.api.nvim_list_uis()[1].height
        local gwidth = vim.api.nvim_list_uis()[1].width
        local width = 90
        local height = 30
        require("nvim-tree").setup({
            on_attach = "default",
            disable_netrw = true,
            hijack_netrw= true,
            view = {
                centralize_selection = true,
                float = {
                    enable = true,
                    open_win_config = {
                        relative = "editor",
                        width = width,
                        height = height,
                        row = (gheight - height) * 0.5,
                        col = (gwidth - width) * 0.5,
                    },
                },
            },
        })
    end
}
