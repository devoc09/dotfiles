return {
    "phaazon/hop.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "ff", function() require("hop").hint_char1() end },
        { "fj", function() require("hop").hint_lines_skip_whitespace() end },
        { "fj", function() require("hop").hint_words() end },
    },
    config = function()
        require("hop").setup({ multi_windows = true })
    end,
}
