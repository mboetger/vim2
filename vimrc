set nocompatible

call pathogen#infect()
call pathogen#helptags()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

syntax on

autocmd FileType *      set formatoptions=tcql nocindent comments&
autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://

set autoindent
set autowrite
ab #d #define
ab #i #include
ab #b /********************************************************
ab #e ********************************************************/
ab #l /*------------------------------------------------------*/
set notextmode
set notextauto
set hlsearch
set incsearch
set textwidth=70
set number

nmap <F8> :TagbarToggle<CR>

filetype plugin on
set omnifunc=syntaxcomplete#Complete

source ~/.vim/computer-specific.vim

au BufNewFile,BufRead *.gradle setf groovy

map <F5> :execute "grep! -R " . expand("<cword>") . " ." <BAR> cw<CR>
map <F6> :exectue "grep! -R " . expand("'<,'>") . " >"  <BAR> cw<CR>

if bufwinnr(1)
  map + <C-W>+
  map = <C-W>+
  map - <C-W>-
endif
