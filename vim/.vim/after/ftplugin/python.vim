if !filereadable(expand("%:p"))
    silent 0r $HOME/.vim/template/skeleton.py
endif

setlocal tabstop=4 shiftwidth=4 expandtab autoindent

let b:undo_ftplugin = '|setlocal tabstop< shiftwidth< expandtab< autoindent<'
