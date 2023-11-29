UsePlugin 'lsp_signature.nvim'

lua << EOF
config = {
    doc_lines = 0,
    hint_enable = false,
    floating_window = true,
}
require 'lsp_signature'.setup(config)
EOF
