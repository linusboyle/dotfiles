" vim:set foldmethod=marker foldlevel=0:

" .vimrc
" Copyright (c) 2018 Linus Boyle <linusboyle@gmail.com>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" vim configuration file of Linus Boyle
" with referrence to a great many others' files
" this configuration file is folded in the method "marker"

if v:progname ==? "evim"
    finish
endif

set nocp

" syntax highlight
if has('syntax')
    syntax enable
    syntax on
endif

" ftplugin
if has('autocmd')
    filetype plugin indent on
    filetype on
endif

if has('diff') && v:version > 800
    set diffopt+=algorithm:patience
    set diffopt+=indent-heuristic
endif

" indent
set autoindent " Use indent of previous line on new lines
set smartindent
set tabstop=4 " Tab键的宽度
set shiftwidth=4 " 缩进对应的空格数
set softtabstop=4 " Tab缩进
set expandtab
set smarttab
set shiftround

" virtual edit
if has('virtualedit')
    set virtualedit+=block
endif

if has('linebreak')
    set linebreak " break lines after words
endif

if has('folding')
  set foldenable
  set foldlevelstart=99
  set foldmethod=indent
endif

" format options
set formatoptions+=m " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B " 合并两行中文时，不在中间加空格
set formatoptions+=j " merge comments
" and do not add two spaces when joining
set nojoinspaces

" search
if &t_Co > 2 || has("gui_running")
    set hlsearch
endif
set incsearch

" gutter column
set relativenumber 
set number

if exists('+completeopt')
    set completeopt=menu,menuone
endif

" case setting
set noignorecase
set nosmartcase

" backspace
set backspace+=eol,start,indent

" sorry for you poor kids...
set shortmess=atI

" use bash aliases
let $BASH_ENV = "~/.bash_aliases"

" esckey
set timeoutlen=200

" pop prompt on failed operation
set confirm

" history storage
set history=2000

" program used when running :grep
if filereadable('/usr/bin/ag')
    set grepprg=ag\ --vimgrep
endif

" autoload the file if it is edited 
set autoread

" backup/swap/undo
set nobackup
if has("persistent_undo")
    let s:undo_dir = expand("~/.cache/undodir")

    if !isdirectory(s:undo_dir)
        silent! call mkdir(s:undo_dir, 'p')
    endif

    set undodir=~/.cache/undodir
    set undofile
endif

" mouse settings
set mouse=a
set mousehide

" terminal setting
set title
set novisualbell " remove error bell
set noerrorbells
set t_vb=
set ttyfast

" For regular expressions turn magic on
set magic

" cursor display
set nocursorcolumn
set nocursorline

" status line display
set laststatus=1 " default
set noshowmode " don't show mode

" Allow buffers to have changes without being displayed
set hidden

" 在状态栏显示正在输入的命令
if has('cmdline_info')
    set showcmd
    set noruler " and do not show the ruler!
endif

" don't jump!
set noshowmatch

" wildmenu settings
set wildmenu
set wildmode=list,full

" encodings
"
" Use UTF-8 if we can and env LANG didn't tell us not to
if has('multi_byte') && !exists('$LANG') && &encoding ==# 'latin1'
  set encoding=utf-8
endif

set fileencodings=utf-8,ucs-bom,gb18030,big5,cp936,euc-jp,euc-kr,latin1
set helplang=cn
set termencoding=utf-8

" colorscheme and gui setting
if has('gui_running')
    set guifont=Source\ Code\ Pro\ SemiBold\ 12
    set guioptions-=T
    set guioptions-=e
    set guioptions-=r
    set guioptions-=m
    set guioptions-=L
    colorscheme space-vim-dark
else
    colorscheme sahara 
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-,a-,g-,f-
set cscopeprg=gtags-cscope
set cscopetag
    
let g:todo_pattern = '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|BUG\|HACK\)'
let g:debug_pattern = '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)'

" General Mapping----------------------{{{ 

" grep operator
nmap gs <plug>GrepOperatorNormal
vmap gs <plug>GrepOperatorVisual

" gtags cscope find operations
nmap <leader><leader>s <plug>gtagsfind_s
nmap <leader><leader>g <plug>gtagsfind_g
nmap <leader><leader>c <plug>gtagsfind_c
nmap <leader><leader>t <plug>gtagsfind_t
nmap <leader><leader>e <plug>gtagsfind_e
nmap <leader><leader>f <plug>gtagsfind_f
nmap <leader><leader>i <plug>gtagsfind_i
nmap <leader><leader>d <plug>gtagsfind_d
nmap <leader><leader>a <plug>gtagsfind_a

"Fundamental Mapping---------------{{{

nnoremap <Space> <PageDown>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap gk k
nnoremap gj j

" move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H ^
noremap L g_

" => 选中及操作改键
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
nnoremap Y y$

nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>
nnoremap <leader>w :w<CR>

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

noremap <c-z> <NOP>
noremap <c-s> <NOP>
"no help,thx
noremap <F1> <NOP>

" }}}

"Commandline Mapping--------------------{{{
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}

"Search Utility-------------------------{{{

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap <silent> <leader>/ :<C-U>nohlsearch<CR><C-L>
vnoremap <silent> <leader>/ :<C-U>nohlsearch<CR>gv<C-L>

"}}}

"Tab/buffer Related------------------{{{

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" }}}

"InsertMode Mapping-----------------------{{{
inoremap <c-l> <right>
inoremap <c-h> <left>
" }}}

" }}}

"Plugin Setting-------------------------{{{

"line
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" nerdtree ------------------{{{
augroup nerdtree_cli
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

noremap <F7> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

"}}}

"easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f2)
noremap <leader><leader>w <Plug>(easymotion-w)
noremap <leader><leader>b <Plug>(easymotion-b)

"YCM-------------------------------{{{
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" 触发补全快捷键 
let g:ycm_key_list_select_completion = ['<TAB>'] 
let g:ycm_key_list_previous_completion = ['<c-p>'] 

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_server_log_level = 'info'
let g:ycm_complete_in_strings = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_collect_identifiers_from_tags_files = 0

let g:ycm_show_diagnostics_ui = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_enable_diagnostic_signs = 0

let g:ycm_error_symbol = '×'
let g:ycm_warning_symbol = '☯'

"white list
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "sh":1,
            \ "html":1
            \ }

"nnoremap <leader>s :YcmCompleter GetType<CR>
" kind of useful
"nnoremap <leader>f :YcmCompleter FixIt<CR>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp': ['re!\w{2}'],
            \ 'html': ['re!\w{2}','</'],
            \ }
"}}}

"undo tree
let g:undotree_WindowLayout = 3
let g:undotree_ShortIndicators = 1
let g:undotree_TreeNodeShape = '・'

nnoremap <F6> :UndotreeToggle<cr>


"Leaderf -------------------------------------{{{
let g:Lf_ShortcutF = '<c-p>'
"let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>

if(!has("gui_running"))
    execute "set <M-p>=\ep"
    execute "set <M-n>=\en"
    execute "set <M-m>=\em"
endif

noremap <m-p> :LeaderfFunction!<cr>
noremap <m-b> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>

"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_StlSeparator = { 'left': '', 'right': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn','.hg','.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'one'
let g:Lf_PreviewResult = {'Function':0}
let g:Lf_Ctags= '/usr/bin/ctags' 

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
"}}}

"gutentags --------------{{{
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

"" 所生成的数据文件的名称
"let g:gutentags_ctags_tagfile = '.tags'

"let g:gutentags_modules = []
"let g:gutentags_define_advanced_commands = 1

"if executable('ctags')
    "let g:gutentags_modules += ['ctags']
"endif

"" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

""if executable('gtags-cscope') && executable('gtags')
    ""let g:gutentags_modules += ['gtags_cscope']
""else
    ""echo "no gtags found,I think you reinstalled the system,take care bro.:)"
""endif

"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags

"" 检测 ~/.cache/tags 不存在就新建
"if !isdirectory(s:vim_tags)
   "silent! call mkdir(s:vim_tags, 'p')
"endif

"plus
"let g:gutentags_auto_add_gtags_cscope = 0
"let g:gutentags_plus_nomap = 1

"noremap <silent> <leader><leader>s :GscopeFind s <C-R><C-W><cr>
"noremap <silent> <leader><leader>g :GscopeFind g <C-R><C-W><cr>
"noremap <silent> <leader><leader>c :GscopeFind c <C-R><C-W><cr>
"noremap <silent> <leader><leader>t :GscopeFind t <C-R><C-W><cr>
"noremap <silent> <leader><leader>e :GscopeFind e <C-R><C-W><cr>
"noremap <silent> <leader><leader>f :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader><leader>i :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader><leader>d :GscopeFind d <C-R><C-W><cr>
"noremap <silent> <leader><leader>a :GscopeFind a <C-R><C-W><cr>

"}}}

"delimitmate
let g:delimitMate_expand_cr = 1

nmap gw <plug>(InteractiveWindow)

"header
let g:header_field_author = 'Linus Boyle'
let g:header_field_author_email = 'linusboyle@gmail.com'
let g:header_auto_add_header = 0

"echodoc
let g:echodoc#enable_at_startup = 1

"repl
nnoremap <leader>r :REPLToggle<Cr>
let g:sendtorepl_invoke_key = "<leader>o" 
let g:repl_position = 3
let g:repl_width = 50
let g:repl_program = {
            \	"python": "python3",
            \	"default": "bash",
            \   "javascript": "node",
            \   "cpp": "cling",
            \	}
let g:repl_input_symbols = {
            \   'python': ['>>>', '>>>>', 'ipdb>', 'pdb', '...'],
            \   'javascript': ['>', '...'],
            \   'cpp':['[cling]$','[cling]$ ?'],
            \   }
let g:repl_exit_commands = {
            \	"python": "quit()",
            \   "node":'.exit',
            \   "cling":".q",
            \	"bash": "exit",
            \	"zsh": "exit",
            \	"default": "exit",
            \	}

" quick-scope
let g:qs_max_chars=80
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"}}}

runtime thirdparty.vim

nohlsearch
