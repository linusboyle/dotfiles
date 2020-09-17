setlocal norelativenumber
setlocal nonumber

let b:undo_ftplugin .= '|setlocal relativenumber<'
            \ . '|setlocal number<'
