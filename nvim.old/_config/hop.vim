UsePlugin 'hop.nvim'

lua << EOF
local hop = require('hop')
hop.setup {
    multi_windows = true,
}
vim.keymap.set('n', 'ff', function() hop.hint_char1() end, {noremap = true, silent = true})
vim.keymap.set('n', 'fj', function() hop.hint_lines_skip_whitespace() end, {noremap = true, silent = true})
vim.keymap.set('n', 'fk', function() hop.hint_words() end, {noremap = true, silent = true})
EOF
