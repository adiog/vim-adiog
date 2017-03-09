" vim
" aleksander gajewski <adiog@brainfuck.pl>
" modified: Thu 26 Jan 2017 09:16:49 PM CET

""" HELP
" :h <topic>
" :verbose map <shortcut>

set nocompatible

let g:layout = 'dvorak'

if has('unix')
  " unix
else
  let $HOME="C:\\Users\\Aleksander\\"
  " prevent loading C:\Windows\system32
  cd $HOME
  set guifont=Courier\ New:h13
endif

if has("gui_running")
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar"}}}
endif

""" continous work - save/restore vimenv, marks, folds etc.
autocmd! BufWinLeave * silent! mkview
autocmd! BufWinEnter * silent! loadview

""" KEY MAPPINGS
" General mappings {{{
" never-ever use insert
imap <insert> <esc>:w<CR>m':%! clang-format %<CR>``
nnoremap <insert> :w<CR>m':%! clang-format %<CR>``

" never-ever use Ex mode
nnoremap Q <nop>

" system clipboard
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa

" quit
command! WQ wq
command! Wq wq
command! W %!sudo tee %<CR> 
command! Q q
"nnoremap <C-F1> :Man <cword>

let mapleader='\'


function! Quit()
  if &modified == 0
    exe ':qa'
  endif
endfunction

noremap zz :call Quit()<CR>

" command
map  ;; :
vmap ;; :
imap ;; <Esc>:

" search
noremap  // :%s///g<Left><Left><Left>
vnoremap // :s///g<Left><Left><Left>

" align
vnoremap /@ :Tabularize /

" }}}

" Fx mappings {{{
" FX 1-4
nnoremap <silent> <F1>      :NERDTreeTabsToggle<CR>
"inoremap <silent> <F1> <ESC>:NERDTreeTabsToggle<CR>
"nnoremap <silent> <C-F1>      :NERDTreeFind<CR>
"inoremap <silent> <C-F1> <ESC>:NERDTreeFind<CR>

inoremap <silent> <F2> <ESC>mX:w<CR>`Xa
nnoremap <silent> <F2>      mX:w<CR>`X
if has("unix")
  inoremap <silent> <C-F2> <ESC>mX:%!sudo tee %<CR>`Xa
  nnoremap <silent> <C-F2>      mX:%!sudo tee %<CR>`X
endif

nnoremap <silent> <F3>      :GundoToggle<CR>
inoremap <silent> <F3> <ESC>:GundoToggle<CR>
nnoremap <silent> <F4>      :TagbarToggle<CR>

"nnoremap <silent> <C-F3>      :Gdiff<CR>
"inoremap <silent> <C-F3> <ESC>:Gdiff<CR>
"nnoremap <silent> <C-F4>      :Gcommit<CR>
"inoremap <silent> <C-F4> <ESC>:Gcommit<CR>
"inoremap <silent> <F4> <ESC>:set spell! spell?<CR>a
"nnoremap <silent> <F4>      :set spell! spell?<CR>
"nnoremap <silent> <C-F> :call g:NextLang()<CR>

set pastetoggle=<F8>
" FX 1-4 ESC
"inoremap <silent> <ESC><F7> <ESC>:tabnew $MYVIMRC<CR>a
inoremap <silent> <ESC><F7> <ESC>:tabnew $HOME/.vim/bundle/vim-adiog/.vimrc<CR>a
nnoremap <silent> <ESC><F7>      :tabnew $HOME/.vim/bundle/vim-adiog/.vimrc<CR>
inoremap <silent> <ESC><F8> <ESC>:tabnew $HOME/.vim/bundle/vim-adiog/plugin/adiog.vim<CR>a
nnoremap <silent> <ESC><F8>      :tabnew $HOME/.vim/bundle/vim-adiog/plugin/adiog.vim<CR>
nnoremap <silent> <ESC><F9>      :! $HOME/.vim/vim-adiog/reload.sh<CR>
"nnoremap <silent> <ESC><F3> :call g:NextLang()<CR>
"inoremap <silent> <ESC><F4> <ESC>:set spell<CR>:execute "split ".&spf<CR>
"nnoremap <silent> <ESC><F4>      :set spell<CR>:execute "split ".&spf<CR>

inoremap <silent> <F9> <ESC>:!make<CR>a
inoremap <silent> <F10>   <ESC>:q<CR>
nnoremap <silent> <F10>        :q<CR>
inoremap <silent> <C-F10> <ESC>:q!<CR>
nnoremap <silent> <C-F10>      :q!<CR>

nnoremap <silent> <ESC><BackSpace>      m':%s/\s*$//g<CR>:nohl<CR>:diffo<CR>``
inoremap <silent> <ESC><BackSpace> <ESC>m':%s/\s*$//g<CR>:nohl<CR>:diffo<CR>``a

"inoremap <F12> <ESC>:call NextColor(1)<CR>a
"inoremap <C-F12> <ESC>:call NextColor(-1)<CR>a

"inoremap <C-F8> <ESC>:set nowrap! nowrap?<CR>a
"nnoremap <C-F8> :set nowrap! nowrap?<CR>
"inoremap <C-F9> <ESC>:call indent_guides#toggle()<CR>a
"inoremap <C-F10> <ESC>:set list! list?<CR>a

"nnoremap <C-BS> :%s/\s*$//g<CR>:nohl<CR>
" }}}

"ctrl-space
"inoremap <C-@> <C-x><C-o>

if g:layout == 'dvorak'
  " quick ESC
  inoremap hh <ESC>l

  nnoremap t gj
  nnoremap n gk
  nnoremap s l
  nnoremap j t
  nnoremap k n
  nnoremap l s

  vnoremap t gj
  vnoremap n gk
  vnoremap s l
  vnoremap j t
  vnoremap k n
  vnoremap l s

  " boosted letter-arrows
  inoremap <C-h> <ESC>Bi
  inoremap <C-s> <ESC>lWi

  nnoremap <C-h> B
  nnoremap <C-t> 5gj
  nnoremap <C-n> 5gk
  nnoremap <C-s> W

  vnoremap <C-t> 5gj
  vnoremap <C-n> 5gk

else
"{{{"{{{"}}}
  " quick ESC
  inoremap jj <Esc>l

  " navigation - wrapped lines
  nnoremap j gj
  nnoremap k gk
"}}}
endif


" GENERAL CONFIG {{{
" backup
if has('unix')
  let backupdirpath=$HOME.'/.vim/backup'
  if !isdirectory(backupdirpath)
    call mkdir(backupdirpath, "p")
  endif
  set backup
  set backupdir=~/.vim/backup
else
  let $HOME="C:\\Users\\Aleksander\\"
  cd $HOME
endif

" switch off annoying visualbell
set novisualbell        " turn off visual bell
set visualbell t_vb=    " turn off error beep/flash

" input: use mouse, encoding
set mouse=a
set ttymouse=xterm2      "needed in screen
set enc=utf-8
set tenc=utf-8
scriptencoding utf-8

" inserting
set expandtab           "et - spaces instead of tabs
set tabstop=2           "uses tabstop at start of lines
set softtabstop=2       "backspace spaces like tabs
set shiftwidth=2        "amount of block using <, >
set smarttab            "uses shiftwidth instead of tabstop
set autoindent          "turns it on
set smartindent         "does the right thing (mostly) in programs
set cindent             "stricter rules for C programs
set showmatch
set matchtime=3

" splitting
set splitbelow
set splitright

" tabs - instead of default 10
set tabpagemax=80

" syntax highlighting
filetype plugin indent on
syntax enable
set listchars=tab:▸-,eol:¬,trail:.,nbsp:~
set laststatus=2
set number
set incsearch
set hlsearch
set wildmode=full
set wildmenu
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands

"setlocal colorcolumn=80
"setlocal textwidth=80
"setlocal colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'   ht
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
"match ErrorMsg '\%>80v.\+'
"2mat ErrorMsg '\%81v.'
highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/

" deal with invisibles
set backspace=indent,eol,start
set backspace=2
set virtualedit=onemore

set guitablabel=%t"}}}

" autosave .note files {{{
set updatetime=1000
au CursorHoldI,CursorHold,BufLeave *.note silent! w
" }}}

" NerdTree {{{
" change directory to edited file path
set autochdir

let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=1

" open/close NERDTree
function! NerdTreeToggle()
  if exists("t:NERDTreeBufName")
    let w = bufwinnr(t:NERDTreeBufName)
    if w != -1
      exe 'NERDTreeClose'
    else
      exe 'NERDTree'
    endif
  else
    exe 'NERDTree'
  endif
endfunction

" close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
autocmd! WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" }}}

" adjust {{{
" bubble single lines
imap <A-Up> <ESC>[ea
imap <A-Down> <ESC>]ea
nmap <A-Up> [e
nmap <A-Down> ]e

imap <A-n> <ESC>[ea
imap <A-t> <ESC>]ea
nmap <A-n> [e
nmap <A-t> ]e

" bubble multiple lines
vmap <A-Up> [egv
vmap <A-Down> ]egv

vmap <A-n> [egv
vmap <A-t> ]egv


" move blocks
inoremap <A-Right> <ESC>m'V>><ESC>``a
nnoremap <A-Right> m'V>><ESC>``
vnoremap <A-Right> >><ESC>gv
inoremap <A-Left> <ESC>m`V<<<ESC>``a
nnoremap <A-Left> m`V<<<ESC>``
vnoremap <A-Left> <<<ESC>gv

"inoremap <A-s> <ESC>m'V>><ESC>``a
nnoremap <A-s> m'V>><ESC>``
vnoremap <A-s> >><ESC>gv
inoremap <A-h> <ESC>m`V<<<ESC>``a
nnoremap <A-h> m`V<<<ESC>``
vnoremap <A-h> <<<ESC>gv
" }}}




" set 256 terminal colors
set t_Co=256

function! SetColoMustang()
    set background=dark
    colo mustang
    let g:airline_theme="badwolf"
    highlight! ColorColumn ctermfg=Magenta guifg=black ctermbg=236 guibg=orange
endfunction

function! SetColoAnotherdark()
    set background=dark
    let g:airline_theme="badwolf"
    colo anotherdark
    highlight! ColorColumn ctermbg=236 guibg=orange
endfunction

function! SetColoSummerfruit()
  set background=light
  let g:airline_theme="light"
  colo summerfruit256
  highlight! ColorColumn ctermbg=74 guibg=lightblue
endfunction

function! SetColoPaper()
  set background=light
  let g:airline_theme="papercolor"
  colo PaperColor
  highlight! ColorColumn ctermbg=254 guibg=lightgrey
endfunction

if version > 730
  set colorcolumn=81,121,122
endif

nnoremap <F7> :call SetColoMustang()<CR>
nnoremap <F8> :call SetColoPaper()<CR>
nnoremap <F9> :call SetColoSummerfruit()<CR>
"nnoremap <F10> :call SetColoAnotherdark()<CR> 
nnoremap <F11> :call NextColor(-1)<CR>
nnoremap <F12> :call NextColor(1)<CR>

call SetColoPaper()

set foldmethod=marker

"if has('unix')
"let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }

"let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
"
"
"
let g:NERDTreeMapOpenInTab = "l"
let g:NERDTreeMapOpenInTabSilent = "L"
let g:NERDTreeMapOpenSplit = "c"
let g:NERDTreeMapOpenVSplit = "r"
let g:NERDTreeMapRefresh = "X"

