setlocal path+=/usr/include
setlocal path+=/usr/include/c++/10/ "standard library path
compiler g++

"nnoremap <buffer> <silent> <F8> :AsyncRun -cwd=<root>/build -raw cmake .. && make <cr>

let b:delimitMate_matchpairs = "(:),[:],{:}"

let b:undo_ftplugin .= '|unlet b:delimitMate_matchpairs'
            \ . '|setlocal path<'
            \ . '|nunmap <buffer> <F8>'
