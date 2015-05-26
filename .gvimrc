" Tlist stuff
"let Tlist_Use_Right_Window = 1
"autocmd VimEnter * TlistToggle

"execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



" set backround color.
"colorscheme peachpuff
" Show match for partly typed search
set incsearch
"?
"set tags
" ignore case while searching.
set ic
" enable highlight search.

set hlsearch
"width & height of window.
set lines=80 columns=80
"?
set showmatch
"hide the mouse when typing.
set mousehide
"?
set ofu=syntaxcomlete#Complete
" set tabs as spaces.
set et
"?
set showcmd
"?
set guioptions-=T
" size of a hard tabstop
set tabstop=4
" something with ctags.
set csto=1
" size of an "indent"
set shiftwidth=4

"set foldmethod=syntax
"set foldcolumn=1

au BufNewFile,BufRead *.c.*.tmp setf c
au BufNewFile,BufRead *.h.*.tmp setf c
au BufNewFile,BufRead *.mak.*.tmp setf make
au BufNewFile,BufRead Makefile.*.tmp setf make

if &diff
"  set guifont=Courier\ Pitch\ 10
  noremap <silent> <s-F11> :diffget<cr>
  noremap <silent> <s-F10> :diffput<cr>
  noremap <silent> <a-g> :diffget<cr>
  noremap <silent> <a-p> :diffput<cr>
  map <space> ]czz
  map <s-f19> [czz
  map <cr> ]czz
  map <s-cr> [czz
  map <silent> <f5> :diffup<cr>
  imap <silent> <f5> <esc>:diffup<cr>a
  map <silent> <f2> :set diffopt^=iwhite<cr>
  map <silent> <s-f2> :set diffopt-=iwhite<cr>
  map <silent> <a-d> :set diff!<cr>
  cnoreab q qa
  cnoreab qq q
  cnoreab x xa
  cnoreab xx x

  " colors in diff
  hi DiffAdd term=bold ctermbg=4 guibg=#d6ffb0
  hi DiffChange term=bold ctermbg=5 guibg=#f6e8d0
  hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=lightGray guibg=DarkGray
  hi DiffText term=reverse cterm=bold ctermbg=1 gui=bold guibg=#e3c1a5

  "set guifont=-schumacher-clean-medium-r-normal--13-130-75-75-c-60-iso646.1991-irv
  "set guifont=-Schumacher-Clean-Medium-R-Normal--13-130-75-75-C-60-ISO646.1991-IRV
  "set guifont=clean
  "@@@set guifont=fixed\ semi-condensed
  "@@@set guifont=-Misc-Fixed-Medium-R-SemiCondensed--13-120-75-75-C-60-ISO10646-1

  set go-=rRlL dip=filler,context:5000
  "@@@ bring this back when you find good fonts: set lsp=3 co=165 lines=42 noea
  set lsp=3 co=159 noea
  set winwidth=84
  set lines=999
  :winpos 0 0
endif


set textwidth=80
" Highlight space errors in c files
let c_space_errors=1
" Highlight long lines only in .c .h .cpp files.
au BufNewFile,BufRead *.c,*.h,*.cpp exec 'match Error /\%>' . &textwidth . 'v.\+/'

"highlight OverLength ctermbg=darkred ctermfg=white guibg=Green
"match OverLength /\%>80v.\+/

highlight Trailing ctermbg=darkred ctermfg=white guibg=Red
2match Trailing /\s\+$/

highlight Tab ctermbg=darkred ctermfg=white guibg=Red
3match Tab /\t/
map ,l :s/^\(.*\)$/\/\*\1\*\//g<cr>:noh<cr>
" uncomment line
map ,, :s/^\/\*\(.*\)\*\/$/\1/g<cr>:noh<cr>
" swap line up
noremap <silent> <c-up> :call MySwapUp()<cr>
" swap line down
noremap <silent> <c-down> :call MySwapDown()<cr>

" Swap Function:
function! MySwapUp()
  if ( line(".") > 1 )
    let cur_col = virtcol(".") - 1
    if ( line(".") == line("$") )
      normal ddP
    else
      normal ddkP
    endif
    execute "normal " . cur_col . "|"
  endif
endfunction

function! MySwapDown()
  if ( line(".") < line("$") )
    let cur_col = virtcol(".")
    normal ddp
    execute "normal " . cur_col . "|"
  endif
endfunction

" Ctrl-j/k inserts a line.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
