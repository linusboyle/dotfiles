imap <buffer> <silent> ]] ]]<esc><Plug>ZettelSearchMap

iab <buffer> hh ##
iab <buffer> hhh ###
iab <buffer> hhhh ####
iab <buffer> hhhhh #####

nmap <buffer> T <Plug>ZettelYankNameMap
xmap <buffer> z <Plug>ZettelNewSelectedMap
nmap <buffer> gZ <Plug>ZettelReplaceFileWithLink
nnoremap <buffer> <leader>nz :ZettelNew<space>
nnoremap <buffer> <leader>gg :call <SID>CommitAll()<CR>
iunmap <buffer> <cr>
nnoremap <buffer><silent> <F5> :call mdip#MarkdownClipboardImage()<CR>
nnoremap <buffer> <leader>f :ZettelOpen<CR> 

function! s:CommitAll() abort
    execute "Git add -A"
    execute "Gcommit -m " . shellescape(input("enter commit message: "))
endfunction

let b:surround_115 = "**\r**"
let b:surround_105 = "*\r*"

let b:undo_ftplugin = 'iunmap <buffer> ]]'
            \ . '|nunmap <buffer> T'
            \ . '|xunmap <buffer> z'
            \ . '|nunmap <buffer> gZ'
            \ . '|nunmap <buffer> <leader>nz'
            \ . '|nunmap <buffer> <leader>gg'
            \ . '|unlet b:surround_115'
            \ . '|unlet b:surround_105'
            \ . '|nunmap <buffer> <F5>'
            \ . '|nunmap <buffer> <leader>f'
            \ . '|iuna <buffer> hh'
            \ . '|iuna <buffer> hhh'
            \ . '|iuna <buffer> hhhh'
            \ . '|iuna <buffer> hhhhh'
