" aleksander gajewski <ag@qs.cx>
" modified: Sun 20 Apr 2014 04:25:27 PM CEST


autocmd bufwritepre,filewritepre *.sh silent! exe "normal m'"
autocmd bufwritepre,filewritepre *.sh silent! exe "1,5s/modified.*$/modified: " . strftime("%c") . "/g"
autocmd bufwritepost,filewritepost *.sh exe "normal ``"

