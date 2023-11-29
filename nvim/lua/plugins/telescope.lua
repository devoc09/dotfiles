return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = vim.fn.executable("make") == 1,
        },
        {
            "nvim-telescope/telescope-file-browser.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
                config = function()
                    require("nvim-web-devicons").setup({
                        default = true,
                    })
                end
            },
        },
    },
    keys = {
        { "<C-p>", "<cmd>Telescope live_grep<cr>" },
        { "<C-f>", "<cmd>Telescope find_files<cr>" },
        { "<C-s>", "<cmd>Telescope git_status<cr>" },
        { "gr", "<cmd>Telescope lsp_references<cr>" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup {
            defaults = {
                preview = {
                    timeout = false
                }
            },
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                git_files = {
                    theme ="ivy",
                },
                git_status = {
                    theme ="ivy",
                },
                live_grep = {
                    theme ="ivy",
                },
            },
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                },
            }
        }
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
}
