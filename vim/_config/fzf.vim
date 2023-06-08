UsePlugin 'fzf.vim'

if !has('win32') || !has('win64')
    nnoremap <C-f> :FZFFileList<CR>
    command! FZFFileList call fzf#run({
                \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
                \ 'sink': 'e' })

    " using Git Grep fuzzy much likes Rg
    command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number -- '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
    nnoremap <C-p> :GGrep<CR>
else
    nnoremap <C-f> <cmd>FZF<cr>
endif

let g:fzf_action = {
            \ 'ctrl-k': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'}
