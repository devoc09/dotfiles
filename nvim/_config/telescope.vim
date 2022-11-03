UsePlugin 'telescope.nvim'

if getftype(".git") == "dir"
    nnoremap <C-f> <cmd>Telescope git_files<cr>
else
    nnoremap <C-f> <cmd>Telescope find_files<cr>
endif
nnoremap <C-p> <cmd>Telescope live_grep<cr>

lua << EOF
require('telescope').setup{
    defaults = {
        preview = {
            timeout = false
        }
    },
    pickers = {
        find_files = {
            theme = "ivy",
        },
        git_files = {
            theme = "ivy",
        },
        live_grep = {
            theme = "ivy",
        },
    },
}
EOF
