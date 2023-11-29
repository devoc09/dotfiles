return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
        { "RRethy/nvim-treesitter-endwise" },
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            config  = function()
                require("ts_context_commentstring").setup {
                    enable_autocmd = false,
                }
            end
        },
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = {
				enable = true,
			},
			endwise = {
				enable = true,
			},
		})
	end,
}
