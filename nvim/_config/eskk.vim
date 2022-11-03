UsePlugin 'eskk.vim'

set imdisable
let g:eskk#directory = "~/.config/nvim/eskk"
let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
let g:eskk#large_dictionary = {"path": "~/dotfiles/vim/SKK-JISYO.L", "sorted": 1, "encoding": "euc-jp",}
let g:eskk#no_default_mappings = 1
let g:eskk#egg_like_newline = 1
let g:eskk#kakutei_when_unique_candidate = 1
let g:eskk#tab_select_completion = 1
autocmd VimEnter * imap <C-k> <Plug>(eskk:toggle)
autocmd VimEnter * cmap <C-k> <Plug>(eskk:toggle)
