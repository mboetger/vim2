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
set tabstop=2
set shiftwidth=2
set expandtab

nmap <F8> :TagbarToggle<CR>

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

source ~/.vim/computer-specific.vim

au BufNewFile,BufRead *.gradle setf groovy

if bufwinnr(1)
  map + <C-W>+
  map = <C-W>+
  map - <C-W>-
endif

let g:bookmark_no_default_key_mappings = 1
nmap <leader>mm :BookmarkToggle<CR>
nmap <leader>mi :BookmarkAnnotate<CR>
nmap <leader>mn :BookmarkNext<CR>
nmap <leader>mp :BookmarkPrev<CR>
nmap <leader>ma :BookmarkShowAll<CR>
nmap <leader>mc :BookmarkClear<CR>
nmap <leader>mx :BookmarkClearAll<CR>

set statusline=%f\ -\ FileType:\ %y\ -\ Branch:\ %{fugitive#statusline()}\ -\ Row:\ %-4l/%-4L\ -\ Col:\ %-4v 

set relativenumber

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--no-hscroll'},'up:60%')
  \           : fzf#vim#with_preview({'options': '--no-hscroll'},'right:50%'),
  \   <bang>0)

function! HeaderToggle()
  let filename = expand("%:t")
  if filename =~ ".cc"
    execute "e %:r.h"
  else
    execute "e %:r.cc"
  endif
endfunction
