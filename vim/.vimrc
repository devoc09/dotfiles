if has('vim_starting')
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

if !has('nvim')
  set nocompatible
  filetype plugin indent on
  syntax on
  syntax enable
  set autoindent
  set autoread
  set backspace=indent,eol,start
  set belloff=all
  set cscopeverbose
  set complete-=i
  set display=lastline
  set encoding=utf-8
  set formatoptions=tcqj
  set fsync
  set history=10000
  set hlsearch
  set incsearch
  set langnoremap
  set laststatus=0
  set listchars=tab:>\ ,trail:-,nbsp:+
  set nrformats=bin,hex
  set ruler
  set sessionoptions-=options
  set shortmess=F
  set showcmd
  set sidescroll=1
  set smarttab
  set tabpagemax=50
  set tags=./tags,tags
  set ttimeoutlen=50
  set ttyfast
  set viminfo+=!
  set wildmenu
endif

set fileformat=unix
scriptencoding utf-8
set fileencoding=utf-8
set nocompatible
set wildmenu
let mapleader = "\<Space>"
set mouse=
set nofoldenable
set number
set showtabline=1
set cmdheight=1
filetype on

call plug#begin('$HOME/.vim/plugged')
" colorscheme
" Plug 'devoc09/yami_q_ray'

" StatusLine
" Plug 'devoc09/lightline.vim'

" plugin to use lightline and git
" Plug 'tpope/vim-fugitive'

" lsp-client
" Plug 'neovim/nvim-lspconfig'
Plug 'prabirshrestha/vim-lsp'

" for ruby
Plug 'tpope/vim-endwise', {'for': 'ruby'}
" for go
"Plug 'mattn/vim-goimports', {'for': 'go'}
" for rust 
" Plug 'rust-lang/rust.vim', {'for': 'rust'}
" Terraform
Plug 'hashivim/vim-terraform'

" usefull
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag', {'for': ['html','xml']}
" Plug 'devoc09/uuid'
" Plug 'devoc09/nvim_hugo_date'
Plug 'tpope/vim-surround'
" Plug 'devoc09/gpt-trans.nvim', {'do': 'make'}
" Plug 'lilydjwg/colorizer'

" Snippet
" Plug 'dcampos/nvim-snippy'
" Plug 'devoc09/my_snippets'

" autocomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'ray-x/lsp_signature.nvim'
" Plug 'nvimdev/lspsaga.nvim'
" Plug 'hrsh7th/cmp-nvim-lua', {'for': 'lua'}
" Plug 'dcampos/cmp-snippy'

" auto-pairs
" Plug 'jiangmiao/auto-pairs'

" FuzzyFinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'nvim-telescope/telescope.nvim'

" require lua plugin async api
" Plug 'nvim-lua/plenary.nvim'

" easy way to cursol-move
Plug 'easymotion/vim-easymotion'
" Plug 'phaazon/hop.nvim'

" Local Plugins
" Plug '~/dotfiles/vim/togglewindow'
" Plug '~/go/src/github.com/devoc09/uuid'
" Plug '~/src/rust/nvim-compleet'

call plug#end()

" split the configuration for each plugins.
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
runtime! _config/*.vim


" set cursorline
" set clipboard=unnamed
set belloff=all
set splitright

"タブ/インデント
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 言語に合わせて適切にインデントを自動挿入
set shiftwidth=4 " smartindentで増減する幅
set tabstop=4 " 連続した空白に対してタブきーやバックスペースキーでカーソルが動く幅
set expandtab

" 文字列検索
set incsearch " インクリメンタルサーチ、1文字入力ごとに検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch

" Colorscheme
" 
" set background=dark
" Important!!
" if exists('+termguicolors')
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"     set termguicolors
" endif
if !empty($COLORTERM)
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
else
    set t_Co=256
endif
let g:rehash256 = 1
colorscheme default
hi LineNr ctermfg=208
hi Comment ctermfg=gray
" opacity settings
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
" highlight LineNr ctermbg=NONE guibg=NONE
" highlight Folded ctermbg=NONE guibg=NONE
" highlight EndOfBuffer ctermbg=NONE guibg=NONE

" Keymapping
"
" Split window
nmap <silent> ss :split<Return><C-w>w
nmap <silent> sv :vsplit<Return>
nmap <silent> st :tabnew<Return>
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap <S-k> {
nnoremap <S-j> }
nnoremap <Left> <C-w><<CR>
nnoremap <Right> <C-w>><CR>
nnoremap <Up> <C-w>+<CR>
nnoremap <Down> <C-w>-<CR>
nnoremap <S-o> <C-o>
" Move Windows.
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l
nnoremap <S-i> <C-i>
"Switch Tabs.
nnoremap <silent> <S-Tab> :-tabnext<Return>
nnoremap <silent> <Tab> :tabnext<Return>

"Usefull
" enhanced vimgrep auto cmd '| cw'
autocmd QuickFixCmdPost *grep* cwindow

command! -count -nargs=* Path :echo expand('%s')
