UsePlugin 'nvim-treesitter'

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "go",
        "java",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "rust",
        "ruby",
        "python",
        "lua",
        "zig",
        "hcl",
        "vim",
        "markdown",
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
