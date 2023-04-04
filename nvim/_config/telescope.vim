UsePlugin 'telescope.nvim'

if getftype(".git") == "dir"
  " nn <C-f> <cmd>Telescope git_files<cr>
  nn <C-f> <cmd>Telescope find_files<cr>
  nn <C-s> <cmd>Telescope git_status<cr>
else
  nn <C-f> <cmd>Telescope find_files<cr>
endif
nn <C-p> <cmd>Telescope live_grep<cr>
nn <C-b> <cmd>lua require('telescope.builtin').treesitter()<cr>

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
        git_status = {
            theme = "ivy",
        },
        live_grep = {
            theme = "ivy",
        },
    },
}
EOF
