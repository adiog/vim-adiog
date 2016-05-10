function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! s:http_code(c)
  let chars = split("$~&%[{}(=*)+]!#`/?@^-_;:,<.>'\"\\|")
  let codes = ["$", "~", "%26", "%25", "%5B", "%7B", "%7D", "(", "=", "*", ")", "%2B", "%5D", "!", "%23", "%60", "/", "?", "@", "%5E", "-", "_", "%3B", ":", ",", "%3C", ".", "%3E", "'", "%22", "%5C", "%7C"]
  return codes[index(chars, a:c)]
endfunction

function! s:http_escape(s)
  let ret = a:s
  let chars = split("$~&%[{}(=*)+]!#`/?@^-_;:,<.>'\"\\|")
  for c in chars
    let ret = substitute(ret, c, "\\\\" . s:http_code(c), "g")
  endfor
  return ret
endfunction

function! Google()
  let q = s:get_visual_selection()
  let q = substitute(q, "\n", "", "g")
  let q = s:http_escape(q)
  if strlen(q) < 256
    let url = "http://www.google.com/search?q=" . q
    exec 'silent !firefox ' . url . ' > /dev/null 2> /dev/null &'
  endif
endfunction

vnoremap ? :call Google()<CR>

