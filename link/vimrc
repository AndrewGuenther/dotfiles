" Set nocp
set nocp

" Set tabs
set tabstop=3
set shiftwidth=3
set expandtab
set smartindent
set softtabstop=3
filetype indent plugin on

" Add omnicompletion
filetype plugin on
set ofu=syntaxcomplete#Complete

" Colorscheme
colorscheme molokai

" Smart home and smart end
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
imap <Home> <C-o><Home>

" Line numbers
set nu

" Set folding to syntax mode and add shortcut
set foldmethod=syntax
set foldlevelstart=50
set foldnestmax=1
nmap \f za
nmap \Ff zR
nmap \FF zM

" Color lines which are too long
if exists('+colorcolumn')
   set colorcolumn=80
else
   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Set JSON filed to be handled as javascript
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.zsh-theme set ft=sh

" Ignore numbers.vim if version < 7.3
let g:pathogen_disabled = []
if version < 703
   call add(g:pathogen_disabled, 'numbers.vim')
endif

" Run Pathogen
execute pathogen#infect()

" Configure localvimrc to not ask for confirmation
let g:localvimrc_ask=0

" Syntastic config
"let g:syntastic_check_on_open=1

" Ctrl-P
let g:ctrlp_map = '<c-p>'

" NerdTree
nmap \e :NERDTreeToggle<CR>

" Tagbar
nmap \t :TagbarToggle<CR>

" Poweline
set laststatus=2
set encoding=utf-8

" Re-indent entire file
map <tab> mzgg=G`z<CR>

" Open NERDTree on startup
autocmd vimenter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd w

" Close NERDTree if it is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open Tagbar on startup
" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType * nested :call tagbar#autoopen(0)

" Disable vim-markdown folding
let g:vim_markdown_folding_disabled=1
