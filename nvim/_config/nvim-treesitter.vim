UsePlugin 'nvim-treesitter'

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "go",
        "javascript",
        "typescript",
        "tsx",
        "rust",
        "python",
        "lua",
        "zig",
        "hcl",
        "php"
    },
    highlight = {
        enable = true,
    },
    endwise = {
        enable = true,
    },
}
EOF
