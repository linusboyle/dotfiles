imap <buffer> <silent> ]] ]]<esc><Plug>ZettelSearchMap
nmap <buffer> T <Plug>ZettelYankNameMap
xmap <buffer> z <Plug>ZettelNewSelectedMap
nmap <buffer> gZ <Plug>ZettelReplaceFileWithLink
nnoremap <buffer> <leader>nz :ZettelNew<space>

let b:undo_ftplugin = '|iunmap <buffer> ||'
            \ . '|nunmap <buffer> T'
            \ . '|nunmap <buffer> z'
            \ . '|nunmap <buffer> gZ'
            \ . '|nunmap <buffer> <leader>nz'
