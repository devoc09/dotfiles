" mapping
let g:nnn#set_default_mappings = 0
nnoremap <silent><Leader>nn :NnnPicker<CR>

" Floating Window
let g:nnn#layout = { 'window': { 'width': 0.4, 'height': 0.6, 'highlight': 'Debug' } }

" Open Files
let g:nnn#action = {
      \ '<c-j>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

let g:nnn#command = 'nnn -d'
