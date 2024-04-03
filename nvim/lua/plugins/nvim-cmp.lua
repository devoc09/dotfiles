return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			preselect = {
				none = true,
			},
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
			},
			sources = {
				{
					name = "nvim_lsp",
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end
					},
				},
				{
					name = "buffer",
					option = {
						get_bufnrs = function()
							local bufs = {}
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								bufs[vim.api.nvim_win_get_buf(win)] = true
							end
							return vim.tbl_keys(bufs)
						end
					},
				},
				{ name = "path" },
			},
		})
		cmp.setup.cmdline("/", {
			sources = {
				{ name = "buffer" }
			}
		})
		cmp.setup.cmdline(":", {
			sources = cmp.config.sources({
				{ name = "path" }
			}, {
				{ name = "cmdline" }
			})
		})
	end,
}
