vim.o.encoding = "utf-8"
vim.o.fileformat = "unix"
vim.o.fileencoding = "utf-8"
vim.o.mouse = "a"
vim.o.foldenable = false
vim.o.wildmenu = true
vim.o.completeopt = "menu,menuone"
vim.o.number = false
-- vim.o.cursorline = true
-- vim.o.clipboard = 'unnamed'
vim.o.belloff = 'all'

-- Tab and Indentation
vim.o.autoindent = true -- Continue indent of the previous line on newline
vim.o.smartindent = true -- Auto-insert indentation according to syntax
vim.o.shiftwidth = 4 -- Indentation amount for < and > commands
vim.o.tabstop = 4 -- Number of spaces that a tab in the file counts for
vim.o.expandtab = true -- Convert tabs to spaces

-- String search settings
vim.o.incsearch = true -- Incremental search, searching as you type
vim.o.ignorecase = true -- Case insensitive searching
vim.o.smartcase = true -- Case sensitive if search pattern contains uppercase
vim.o.hlsearch = true -- Highlight search results

-- window split config
vim.o.splitright = true

-- statusline & tabline
vim.o.showtabline = 1
vim.o.laststatus = 0 -- hidden status line

-- guicolors
if os.getenv("COLORTERM") ~= nil then
    vim.o.termguicolors = true
end

-- colorscheme
vim.cmd("colorscheme default")
vim.opt.background = "dark"
