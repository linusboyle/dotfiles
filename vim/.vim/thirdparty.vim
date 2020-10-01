" vim:set foldmethod=marker foldlevel=0:

" Plugin Setting-------------------------{{{

" cpp syntax
let g:cpp_class_scope_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

"easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)

" coq
let g:coqtail_nomap = 1
function! g:CoqtailHighlight()
    hi def CoqtailChecked ctermbg=17 guibg=DarkCyan
    hi def CoqtailSent ctermbg=60 guibg=Cyan
endfunction

"YCM-------------------------------{{{
"let g:ycm_server_python_interpreter='/usr/bin/python3'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

 "触发补全快捷键 
"let g:ycm_key_list_select_completion = ['<TAB>'] 
"let g:ycm_key_list_previous_completion = ['<c-p>'] 

"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:ycm_server_log_level = 'info'
"let g:ycm_complete_in_strings = 1
"let g:ycm_cache_omnifunc = 0
"let g:ycm_collect_identifiers_from_tags_files = 0
"let g:ycm_seed_identifiers_with_syntax = 1

"let g:ycm_show_diagnostics_ui = 1
"let g:ycm_always_populate_location_list = 0
"let g:ycm_enable_diagnostic_signs = 0

"let g:ycm_error_symbol = '×'
"let g:ycm_warning_symbol = '☯'

"white list
"let g:ycm_filetype_whitelist = {
            "\ "c":1,
            "\ "cpp":1,
            "\ "sh":1,
            "\ "html":1,
            "\ "java":1,
            "\ "javascript":1,
            "\ "python":1
            "\ }

"nnoremap <leader>s :YcmCompleter GetType<CR>
 "kind of useful
"nnoremap <leader>f :YcmCompleter FixIt<CR>

"let g:ycm_semantic_triggers =  {
            "\ 'c,cpp,java': ['re!\w{2}', '.'],
            "\ 'html': ['re!\w{2}','</'],
            "\ }
"}}}

"undo tree
let g:undotree_WindowLayout = 3
let g:undotree_ShortIndicators = 1
let g:undotree_TreeNodeShape = '・'

nnoremap <F6> :UndotreeToggle<cr>

"Leaderf -------------------------------------{{{

"let g:Lf_StlSeparator = { 'left': '', 'right': '' }
"let g:Lf_StlColorscheme = 'powerline'

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font':''}
let g:Lf_RootMarkers = ['.project', '.root', '.svn','.hg','.git']
let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowHeight = 0.25
let g:Lf_PopupHeight = 0.3
let g:Lf_PreviewInPopup = 1

let g:Lf_ShortcutF = '<leader>f'
let g:Lf_ShortcutB = '-'

let g:Lf_MruFileExclude = split(&wildignore, ',')
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': g:Lf_MruFileExclude
        \}

let g:Lf_DefaultMode='FullPath'
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_HideHelp = 1
let g:Lf_JumpToExistingWindow = 1
let g:Lf_PreviewResult = {
            \ 'File': 1,
            \ 'Buffer': 0,
            \ 'Mru': 1,
            \ 'Tag': 0,
            \ 'BufTag': 1,
            \ 'Function': 1,
            \ 'Line': 0,
            \ 'Colorscheme': 0,
            \ 'Rg': 1,
            \ 'Gtags': 0
            \}


"let g:Lf_GtagsAutoGenerate = 1
"let g:Lf_GtagsSource = 2
"let g:Lf_GtagsSkipUnreadable = 1
"let g:Lf_GtagsSkipSymlink = 'a'
"let g:Lf_Gtagslabel='native-pygments'
let g:Lf_ShowDevIcons = 0
let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
"nnoremap - :Leaderf! buffer<cr>
"}}}

"delimitmate
let g:delimitMate_expand_cr = 1

"header
let g:header_field_author = 'Zhilei Han'
let g:header_field_author_email = 'hzl17@mails.tsinghua.edu.cn'
let g:header_auto_add_header = 0

" quick-scope
let g:qs_max_chars=80
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 0
let g:tex_conceal = ""

" asyncrun/neomake
let g:asyncrun_open = 6
let g:neomake_open_list = 2
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
nnoremap <silent> <F9> :Neomake<CR>
nnoremap <silent> <F10> :call asyncrun#quickfix_toggle(6)<cr>

let g:neomake_error_sign = {
\ 'text': '✖',
\ 'texthl': 'SpellBad',
\ }

"ultisnip
let g:UltiSnipsExpandTrigger='<F2>'
let g:UltiSnipsListSnippets='<c-`>'

"echodoc
"let g:echodoc#enable_at_startup = 1

"slime
let g:slime_target = "vimterminal"
let g:slime_vimterminal_config = {"vertical":1, "term_finish": "close"}

"rainbow
let g:rainbow_active=0

"terminal
let g:terminal_default_mapping = 0
let g:terminal_edit = "SelectiveDrop"

nnoremap <silent> + :call TerminalToggle()<CR>
tnoremap <silent> + <c-w>:call TerminalToggle()<CR>

" coc.nvim
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" VimWiki
let g:vimwiki_list = [
            \{
            \"path" : "~/sync/wiki/text/", 
            \"path_html" : "~/sync/wiki/html/", 
            \"syntax": "markdown",
            \"ext": ".md",
            \"auto_tags" : 0,
            \"auto_diary_index" : 1,
            \"diary_rel_path" : "./"
            \}]

let g:vimwiki_ext2syntax = {}
let g:vimwiki_hl_headers = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_toc_header_level = 2
let g:vimwiki_tags_header_level = 2
let g:vimwiki_links_header_level = 2
let g:vimwiki_autowriteall = 0
"let g:vimwiki_conceallevel = 0
let g:vimwiki_key_mappings =
            \ {
            \ 'table_mappings': 0,
            \ }

let g:zettel_format = "%random"
let g:zettel_default_mappings = 0
let g:zettel_date_format = "%Y-%m-%dT%H:%M"
let g:zettel_options = [{ 
            \"front_matter" : [["tags", ""]],
            \}]
            "\"template" :  "~/.vim/template/skeleton.wiki"
"let g:zettel_link_format = "[[%link|%title]]"

let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

" neuron

let g:neuron_dir = expand("~/sync/wiki/text/")
"let g:neuron_extension = ".wiki"
"}}}
