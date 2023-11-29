-- load keymasp, autocmds, config
require("config/keymaps")
require("config/autocmds")
require("config/options")

-- install plugin manager lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- plugins entry point
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})
