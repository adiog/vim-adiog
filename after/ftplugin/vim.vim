" aleksander gajewski <ag@qs.cx>
" modified: Thu 07 Apr 2016 07:59:37 AM CEST

autocmd filetype vim setlocal ts=2 sts=2 sw=2 et
autocmd bufnewfile *.vim silent! so $HOME/config/vim/vimfiles/pattern/vim
autocmd bufnewfile *.vim silent! exe "normal G"

autocmd bufwritepre,filewritepre *.vim silent! exe "normal m'"
autocmd bufwritepre,filewritepre *.vim silent! exe "1,2s/modified.*$/modified: " . strftime("%c") . "/g"
autocmd bufwritepost,filewritepost *.vim exe "normal ``"
autocmd bufwritepost,filewritepost *.vim so $HOME/.vimrc

