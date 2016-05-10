" aleksander gajewski <adiog@brainfuck.pl> 
" modified: Sun 17 Apr 2016 06:19:08 PM CEST

let g:dcxml = -1

function! Loadfiles(extension)
 let g:files = sort(split(glob("*." . a:extension), "\n"))
 let g:dcmax = len(g:files)
endfunction


function! Compare(num)
  exec ":edit " . substitute(g:files[a:num], "\ ", "\\\\\ ", "g")
  exec ":diffthis"
  exec ":new"
  exec ":edit " . substitute(g:files[a:num + 1], "\ ", "\\\\\ ", "g")
  exec ":diffthis"
endfunction

function! NextDc(mod)
  let l:mod = a:mod
  if g:dcxml == -1
    let l:mod = 0
    let g:dcxml = index(g:files, expand("%"))
    echo g:dcxml
  else
    if (g:dcxml == 0 && l:mod == -1) || (g:dcxml == g:dcmax-2 && l:mod == 1)
      echo "No more files!"
      return
    else
      exec ":q!"
    endif
  endif
  let g:dcxml += l:mod
  call Compare(g:dcxml)
endfunction

call Loadfiles('xml')
imap <silent> <ESC><Right> <ESC>:call NextDc(1)<CR>
imap <silent> <ESC><Left>  <ESC>:call NextDc(-1)<CR>
nmap <silent> <ESC><Right> :call NextDc(1)<CR>
nmap <silent> <ESC><Left>  :call NextDc(-1)<CR>
 
au Filetype xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

