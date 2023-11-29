return {
	"dcampos/nvim-snippy",
	event = "InsertEnter",
	dependencies = {
		"devoc09/my_snippets",
	},
	config = function()
		local map = vim.keymap.set
		local snippy = require("snippy").setup({
			enable_auto = true,
		})
		map( { 'i', 's' }, '<tab>', function()
		    return require('snippy').can_expand_or_advance() and '<plug>(snippy-expand-or-advance)' or '<tab>'
		end, { expr = true } )
		map( { 'i', 's' }, '<s-tab>', function()
		    return require('snippy').can_jump(-1) and '<plug>(snippy-previous)' or '<s-tab>'
		end, { expr = true } )
		map('x', '<Tab>', '<plug>(snippy-cut-text)')
		map( 'n', 'g<Tab>', '<plug>(snippy-cut-text)')
	end,
}
