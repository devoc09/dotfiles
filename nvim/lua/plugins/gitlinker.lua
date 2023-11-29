return {
    "ruifm/gitlinker.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "ModeChanged",
    config = function()
        require("gitlinker").setup()
    end
}
