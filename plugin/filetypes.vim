
""" Filetypes {{{
au BufRead,BufNewFile *.json   set filetype=json
au BufRead,BufNewFile *.esh    set filetype=erlang
au BufRead,BufNewFile *.erl    set filetype=erlang
au BufRead,BufNewFile *.hrl    set filetype=erlang

autocmd filetype make setlocal ts=8 sts=8 sw=8 noexpandtab

"autocmd filetype plaintex silent! so ~/.vim/vimrc/tex.vim
autocmd bufwritepre,filewritepre * silent! exe "normal m'"
autocmd bufwritepre,filewritepre * silent! exe "1,4s/modified.*$/modified: " . strftime("%c") . "/g"
autocmd bufwritepost,filewritepost * exe "normal ``"

"C
  autocmd bufnewfile *.c silent! so ~/.vim/bundle/vim-adiog/template/c
  autocmd bufnewfile *.c silent! exe "%s/YEAR/" . strftime("%Y") . "/"
  autocmd bufnewfile *.c silent! exe "%s/FILE/" . expand('%:t') . "/"
  autocmd bufnewfile *.c silent! exe "%s/HEAD/" . substitute(expand('%:t'), '\.c', '\.h', '') . "/"
  autocmd bufnewfile *.c silent! exe "1,5s/created.*$/created:  " . strftime("%c") . "/g"
  autocmd bufnewfile *.c silent! exe "normal G"

"H
  autocmd bufnewfile *.h silent! so ~/.vim/bundle/vim-adiog/template/h
  autocmd bufnewfile *.h silent! exe "%s/YEAR/" . strftime("%Y") . "/"
  autocmd bufnewfile *.h silent! exe "%s/FILE/" . expand('%:t') . "/"
  autocmd bufnewfile *.h silent! exe "%s/HEAD/" . substitute(toupper(expand('%:t')), '\.', '_', '') . "/"
  autocmd bufnewfile *.h silent! exe "1,5s/created.*$/created:  " . strftime("%c") . "/g"
  autocmd bufnewfile *.h silent! exe "normal G"

"CPP
  autocmd bufnewfile *.cpp silent! so ~/.vim/bundle/vim-adiog/template/cpp
  autocmd bufnewfile *.cpp silent! exe "%s/YEAR/" . strftime("%Y") . "/"
  autocmd bufnewfile *.cpp silent! exe "normal G"
  
  autocmd bufnewfile *.cc silent! so ~/.vim/bundle/vim-adiog/template/cpp
  autocmd bufnewfile *.cc silent! exe "%s/YEAR/" . strftime("%Y") . "/"
  autocmd bufnewfile *.cc silent! exe "normal G"






let g:rooter_autocmd_patterns = '*.c,*.h,*.cpp,*.hpp'
let g:rooter_patterns = ['CMakeLists.txt', '.git/']

"ERLANG
autocmd bufnewfile *.esh silent! so ~/.vim/bundle/vim-adiog/template/esh
autocmd bufnewfile *.esh silent! exe "%s/YEAR/" . strftime("%Y") . "/"
autocmd bufnewfile *.esh silent! exe "%s/__MODULE__/" . substitute(expand('%:t'),'\(.*\).erl', '\1', 'g') . "/"
autocmd bufnewfile *.esh silent! exe "1,5s/created.*$/created:  " . strftime("%c") . "/g"
autocmd bufnewfile *.esh silent! exe "normal G"
 
autocmd bufnewfile *.erl silent! so ~/.vim/bundle/vim-adiog/template/erl
autocmd bufnewfile *.erl silent! exe "%s/YEAR/" . strftime("%Y") . "/"
autocmd bufnewfile *.erl silent! exe "%s/__MODULE__/" . substitute(expand('%:t'),'\(.*\).erl', '\1', 'g') . "/"
autocmd bufnewfile *.erl silent! exe "1,5s/created.*$/created:  " . strftime("%c") . "/g"
autocmd bufnewfile *.erl silent! exe "normal G"

autocmd bufnewfile *.hrl silent! so ~/.vim/bundle/vim-adiog/template/erl
autocmd bufnewfile *.hrl silent! exe "%s/YEAR/" . strftime("%Y") . "/"
autocmd bufnewfile *.hrl silent! exe "g/__MODULE__/d"
autocmd bufnewfile *.hrl silent! exe "g/export/d"
autocmd bufnewfile *.hrl silent! exe "1,5s/created.*$/created:  " . strftime("%c") . "/g"
autocmd bufnewfile *.hrl silent! exe "normal G"

"BASH
  autocmd bufnewfile *.sh silent! so ~/.vim/bundle/vim-adiog/template/sh

  autocmd bufnewfile *.sh silent! exe "%s/YEAR/" . strftime("%Y") . "/"
  autocmd bufnewfile *.sh silent! exe "1,5s/created.*$/created:  " . strftime("%c") . "/g"
  autocmd bufnewfile *.sh silent! exe "normal G"

autocmd bufnewfile Makefile silent! so ~/.vim/bundle/vim-adiog/template/Makefile
autocmd bufnewfile CMakeLists.txt silent! so ~/.vim/bundle/vim-adiog/template/CMakeLists.txt

"tex
autocmd bufnewfile *.tex silent! so ~/.vim/bundle/vim-adiog/template/tex
autocmd bufnewfile *.tex silent! exe "%s/YEAR/" . strftime("%Y") . "/"
autocmd bufnewfile *.tex silent! exe "1,5s/created.*$/created:  " . strftime("%c") . "/g"
autocmd bufnewfile *.tex silent! exe "normal G"

" }}}
"
