" aleksander gajewski <ag@qs.cx>
" modified: Tue 02 Dec 2014 10:28:01 AM CET


autocmd bufwritepre,filewritepre *.c silent! exe "normal m'"
autocmd bufwritepre,filewritepre *.c silent! exe "1,5s/modified.*$/modified: " . strftime("%c") . "/g"
autocmd bufwritepost,filewritepost *.c exe "normal ``"

au Filetype c setlocal equalprg=astyle\ --style=ansi\ --break-closing-brackets\ --break-blocks=all\ --add-brackets\ \ --delete-empty-lines\ --indent-preprocessor\ --pad-oper\ --pad-paren-out\ --pad-header\ --align-pointer=type

imap /// /*  */<Left><Left><Left>

iab pri printf("%d\n", );


