set nocompatible
set encoding=utf-8
scriptencoding utf-8
set fileformats=unix,mac,dos
set termencoding=utf-8
set printencoding=utf-8
syntax on
filetype plugin indent on
set backspace=indent,eol,start
set nobackup noswapfile
let mapleader = '\<Space>'
set autoread
set fsync
set ruler
set shortmess=F
set ttimeoutlen=50
set ttyfast
set sidescroll=1

" vim-plug installation
let s:settings_config_dir = expand('~/.vim')
let s:settings_plugin_path = expand(s:settings_config_dir . '/plugins')
if empty(glob(s:settings_config_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.s:settings_config_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endi

let g:plug_shallow = 0
call plug#begin(s:settings_plugin_path)
Plug 'devoc09/tender.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" gui options
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
if !has('gui_running') && (&t_Co == 256 || $COLORTERM == 'truecolor')
    set t_Co=256
    " Enable true color support
    if $COLORTERM == 'truecolor'
        set termguicolors
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif
set guicursor=a:blinkon0
set background=dark
set cursorline

" colorscheme
silent! colorscheme tender

set mouse=a
set noerrorbells visualbell t_vb=
set belloff=all
set cmdheight=1
set noshowmode
set hidden
set nowrap
set nofoldenable

" indent
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" search
set incsearch
set ignorecase
set smartcase
set hlsearch

" statusline
set laststatus=2
set showtabline=1

" grep
if executable('rg') | set grepprg=rg\ --no-heading\ --hidden\ -g\ '!.git/'\ --vimgrep grepformat=%f:%l:%c:%m | endi
au QuickfixCmdPost grep,grepadd,vimgrep cwindow

" split
set splitright
set splitbelow

" keymaps
nnoremap <silent>ss :silent split<CR>
nnoremap <silent>sv :silent vsplit<CR>
nnoremap <silent>st :silent tabnew<CR>
nnoremap <silent><CR><CR> <C-w>w
nnoremap <silent>sh <C-w>h
nnoremap <silent>sk <C-w>k
nnoremap <silent>sj <C-w>j
nnoremap <silent>sl <C-w>l
nnoremap <silent><S-Tab> gT
nnoremap <silent><Tab> gt
nnoremap <silent><C-j> :silent cnext<CR>
nnoremap <silent><C-k> :silent cprev<CR>
nnoremap <silent><C-c> :silent cclose<CR>

" easymotion
let g:EasyMotion_do_mapping = 0
nmap <silent>f <Plug>(easymotion-overwin-f)

" asyncomplete.vim
set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
      \ 'name': 'buffer',
      \ 'allowlist': ['*'],
      \ 'completor': function('asyncomplete#sources#buffer#completor'),
      \ 'config': {
        \    'max_buffer_size': 5000000,
        \  },
        \ }))

" vim-lsp
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> gh <plug>(lsp-hover)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs call execute('LspDocumentFormatSync')
  autocmd! BufWritePre *.go call execute(['LspCodeActionSync source.organizeImports', 'LspDocumentFormatSync'])

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" filetypes
au! FileType go,python setlocal autoindent smartindent expandtab tabstop=4 softtabstop=4 shiftwidth=4
au! FileType vim setlocal autoindent smartindent expandtab tabstop=2 softtabstop=2 shiftwidth=2

" fzf
let g:fzf_vim = {}
let g:fzf_vim.buffers_jump = 1
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git"'
  nnoremap <silent><C-p> :silent Rg<CR>
endi
nnoremap <silent><C-f> :silent Files<CR>
