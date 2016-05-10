" aleksander gajewski <ag@qs.cx> 
" modified: Fri 07 Feb 2014 07:23:40 PM CET

autocmd bufnewfile *.py silent! so ~/.vim/pattern/py
autocmd bufnewfile *.py silent! exe "%s/YEAR/" . strftime("%Y") . "/"
autocmd bufnewfile *.py silent! exe "1,5s/created.*$/created:  " . strftime("%c") . "/g"
autocmd bufnewfile *.py silent! exe "normal G"

autocmd bufwritepre,filewritepre *.py silent! exe "normal m'"
autocmd bufwritepre,filewritepre *.py silent! exe "1,5s/modified.*$/modified: " . strftime("%c") . "/g"
autocmd bufwritepost,filewritepost *.py exe "normal ``"

" using plugins: jedi-vim

let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
autocmd FileType python setlocal completeopt-=preview


