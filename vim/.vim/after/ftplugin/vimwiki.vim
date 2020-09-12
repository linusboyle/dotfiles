imap <buffer> <silent> ]] ]]<esc><Plug>ZettelSearchMap
nmap <buffer> T <Plug>ZettelYankNameMap
xmap <buffer> z <Plug>ZettelNewSelectedMap
nmap <buffer> gZ <Plug>ZettelReplaceFileWithLink
nnoremap <buffer> <leader>nz :ZettelNew<space>
nnoremap <buffer> <leader>gg :call <SID>CommitAll()<CR>

function! s:CommitAll() abort
    execute "Git add -A"
    execute "Gcommit -m " . shellescape(input("enter commit message: "))
endfunction

let b:undo_ftplugin = 'iunmap <buffer> ]]'
            \ . '|nunmap <buffer> T'
            \ . '|xunmap <buffer> z'
            \ . '|nunmap <buffer> gZ'
            \ . '|nunmap <buffer> <leader>nz'
            \ . '|nunmap <buffer> <leader>gg'
