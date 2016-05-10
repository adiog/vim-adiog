" aleksander gajewski <ag@qs.cx>
" modified: Tue 02 Dec 2014 10:28:01 AM CET


autocmd bufwritepre,filewritepre *.tex silent! exe "normal m'"
autocmd bufwritepre,filewritepre *.tex silent! exe "1,5s/modified.*$/modified: " . strftime("%c") . "/g"
autocmd bufwritepost,filewritepost *.tex exe "normal ``"

