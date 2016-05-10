let g:rooter_patterns = ['.git/']

" fill -isystem based on $ clang -E -x c++ -v -
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/vim-adiog/.ycm_extra_conf.py'


let g:slime_default_config = {"sessionname": "vscreen", "windowname": "0"}
"let g:slime_dont_ask_default = 1

function! SlimeCMake()
  let root_dir = FindRootDirectory()
  execute "SlimeSend1 vim_cmake " . root_dir
endfunction

function! SlimeCMakeReload()
  let root_dir = FindRootDirectory()
  execute "SlimeSend1 vim_cmake " . root_dir . " RELOAD"
endfunction

function! SlimeCTest()
  let root_dir = FindRootDirectory()
  if !exists("g:slimeRootRunCmd")
    execute "SlimeSend1 vim_ctest " . root_dir
  else
    execute "SlimeSend1 vim_ctest " . root_dir . " " . g:slimeRootRunCmd
  endif
endfunction

function! SlimeRootRun()
  let root_dir = FindRootDirectory()
  let g:slimeRootRunCmd = input("Enter command: ")
  execute "SlimeSend1 vim_root_run " . root_dir . " " . g:slimeRootRunCmd
endfunction

function! SlimeRootRunLast()
  let root_dir = FindRootDirectory()
  if !exists("g:slimeRootRunCmd")
    let g:slimeRootRunCmd = input("Enter command: ")
  endif
  execute "SlimeSend1 vim_root_run " . root_dir . " " . g:slimeRootRunCmd
endfunction

nnoremap <C-F9> :call SlimeCMake()<CR>
nnoremap <C-S-F9> :call SlimeCMakeReload()<CR>
nnoremap <C-F10> :call SlimeCTest()<CR>
nnoremap <C-F11> :call SlimeRootRun()<CR>
nnoremap <C-F12> :call SlimeRootRunLast()<CR>

let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

nnoremap <M-C-Home> :A<CR>



function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif
  echo "Running " . a:cmd . " ..."
  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("clang-check " . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction

nmap <silent> <F5> :call ClangCheck()<CR><CR>

let g:ycm_python_binary_path = '/usr/bin/python3'
