autocmd bufwritepre,filewritepre *.esh silent! exe "normal m'"
autocmd bufwritepre,filewritepre *.esh silent! exe "1,5s/modified: Mon 24 Nov 2014 11:33:02 AM CET
autocmd bufwritepost,filewritepost *.esh exe "normal ``"

autocmd bufwritepre,filewritepre *.erl silent! exe "normal m'"
autocmd bufwritepre,filewritepre *.erl silent! exe "1,5s/modified.*$/modified: " . strftime("%c") . "/g"
autocmd bufwritepost,filewritepost *.erl exe "normal ``"

autocmd bufwritepre,filewritepre *.hrl silent! exe "normal m'"
autocmd bufwritepre,filewritepre *.hrl silent! exe "1,5s/modified.*$/modified: " . strftime("%c") . "/g"
autocmd bufwritepost,filewritepost *.hrl exe "normal ``"


setlocal et
setlocal shiftwidth=4
setlocal colorcolumn=80
highlight ColorColumn ctermbg=236 guibg=blue

"setlocal textwidth=80
"setlocal colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
"ht

inoremap <NUL> <C-x><C-o>

let erlang_skel_header = {"author": "Aleksander Gajewski", "owner" : "Aleksander Gajewski"}

