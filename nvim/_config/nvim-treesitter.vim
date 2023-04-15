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
        "vim",
        "php"
    },
    highlight = {
        enable = false,
    },
    endwise = {
        enable = true,
    },
}
EOF
