UsePlugin 'lspsaga.nvim'

set hidden

lua << EOF
require("lspsaga").setup({
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    title = false,
  },
})

local keymap = vim.keymap.set
keymap('n', '@', '<cmd>Lspsaga hover_doc<CR>')
keymap('n', 'di', '<cmd>Lspsaga show_line_diagnostics<CR>')
EOF
