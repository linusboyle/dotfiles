if !filereadable(expand("%:p"))
    silent 0r $HOME/.vim/template/skeleton.sh
endif

compiler bash
setlocal iskeyword=$,@,48-57,_,192-255

let b:undo_ftplugin .= '|setlocal iskeyword<'
