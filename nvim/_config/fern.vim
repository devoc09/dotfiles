UsePlugin 'fern.vim'

nnoremap <silent>sf :Fern . <CR>

let g:fern#renderer#default#leaf_symbol = "  "
let g:fern#renderer#default#leading = "  "
let g:fern#renderer#default#collapsed_symbol = "▸ "
let g:fern#renderer#default#expanded_symbol = "▾ "
let g:fern#disable_default_mappings = 1

function! s:init_fern() abort
    nmap <buffer><silent>n <Plug>(fern-action-new-dir)
    nmap <buffer><silent>ff <Plug>(fern-action-new-file)
    nmap <buffer><silent>dd <Plug>(fern-action-remove)
    nmap <buffer><silent>yy <Plug>(fern-action-clipboard-copy)
    nmap <buffer><silent>p <Plug>(fern-action-clipboard-paste)
    nmap <buffer><silent>r <Plug>(fern-action-rename)
    nmap <buffer><silent>hp <Plug>(fern-action-help)
    nmap <buffer><silent>l <Plug>(fern-action-open)
    nmap <buffer><silent>! <Plug>(fern-action-hidden)
    nmap <buffer><silent>o <Plug>(fern-action-expand)
endfunction

augroup fern-custom
    autocmd! *
    autocmd Filetype fern call s:init_fern()
augroup END
