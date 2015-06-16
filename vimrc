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

let g:bookmark_no_default_key_mappings = 1
nmap <leader>mm :BookmarkToggle<CR>
nmap <leader>mi :BookmarkAnnotate<CR>
nmap <leader>mn :BookmarkNext<CR>
nmap <leader>mp :BookmarkPrev<CR>
nmap <leader>ma :BookmarkShowAll<CR>
nmap <leader>mc :BookmarkClear<CR>
nmap <leader>mx :BookmarkClearAll<CR>

let g:tern_map_keys=1

set statusline=%{fugitive#statusline()}

let g:bookmark_manage_per_buffer = 0
let g:bookmark_save_per_working_dir = 1

function g:BMBufferFileLocation(file)
  let git=fugitive#head()
  if len(git) ==# 0
    let git='misc'
  endif
  let loc='/usr/local/google/home/boetger/bookmarks/' . git . a:file
  let cmd = 'mkdir -p ' . fnamemodify(loc, ':p:h') . '> /dev/null 2>&1'
  call system(cmd)
  return loc
endfunction

function g:BMWorkDirFileLocation()
  let git=fugitive#head()
  if len(git) ==# 0
    let git='misc'
  endif
  let loc='/usr/local/google/home/boetger/bookmarks/' . git . '/'
  let cmd = 'mkdir -p ' . loc . '> /dev/null 2>&1'
  call system(cmd)
  return loc . 'bookmarks'
endfunction
