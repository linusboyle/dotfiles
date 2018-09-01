" vim:set foldmethod=marker foldlevel=0:

" File              : .vimrc
" Author            : Linus Boyle <linusboyle@gmail.com>
" Date              : 01.09.2018
" Last Modified Date: 01.09.2018
" Last Modified By  : Linus Boyle <linusboyle@gmail.com>

" vim configuration file of Linus Boyle
" with referrence to a great many others' files
" this configuration file is folded in the method "marker"


" General Configuration-------------{{{

" very important :)
set nocp

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 3rd-party plugins first
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" use bash aliases
let g:is_bash	   = 1
let $BASH_ENV = "~/.bash_aliases"

" leader key
let mapleader = ','
let g:mapleader = ','

" syntax highlight
syntax enable
syntax on

" history storage
set history=2000

"beautifier
set formatprg=clang-format\ -style=WebKit

"augroup beautify
    "autocmd!
    "autocmd BufWritePre *.cpp,*.c,*.h execute "normal! ggVGgq\<C-o>\<C-o>"
"augroup END

" program used when running :grep
set grepprg=ag\ --vimgrep

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" autoload the file if it is edited 
set autoread

" sorry for you poor kids...
set shortmess=atI

" disable backup
set nobackup

" no swapfile,it's really dangerous sometimes,take care
"set noswapfile

" as the name suggest
set wildignore+=*.swp,*.bak,*.pyc,*.class,.svn,*.png,*.o,*.obj,*.a,*.so,*.jpg,*.ttf,*.otf,*.svg

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
" i don't like this
"set t_ti= t_te=

" 启用鼠标
set mouse=a
" Hide the mouse cursor while typing
set mousehide

set mps+=<:>

" 禁用选择模式
"set selection=inclusive
"set selectmode=mouse,key

" change the terminal's title
set title

" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=

"键码等待时间
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

"设置左右方向键上下换行，不需要
"set whichwrap+=<,>,h,l

"快速终端
set ttyfast

"}}}

"Display Settings--------------------{{{

" 突出显示当前列
set cursorcolumn
" 突出显示当前行
set cursorline

augroup cursor_display
    autocmd!
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
    autocmd InsertLeave,WinEnter * set cursorcolumn
    autocmd InsertEnter,WinLeave * set nocursorcolumn
augroup END

" 显示当前的行号列号
"set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
"set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 命令行（在状态行下）的高度，默认为1，这里是2
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
"set laststatus=2

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
"let g:FoldMethod = 0
"map <leader>zz :call ToggleFold()<cr>
"fun! ToggleFold(){{{}}}
    "if g:FoldMethod == 0
        "exe "normal! zM"
        "let g:FoldMethod = 1
    "else
        "exe "normal! zR"
        "let g:FoldMethod = 0
    "endif
"endfun

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
set autoindent

" tab相关变更
" 设置Tab键的宽度 [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden

" 00x增减数字时使用十进制
"set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber 
set number

" 失去焦点使用绝对行号
augroup focus_grp
    autocmd!
    au FocusLost * :set norelativenumber
    au FocusGained * :set relativenumber
augroup END
" 插入模式下用绝对行号, 普通模式下用相对
augroup relativenumber_grp
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END

" }}}

" FileEncode Settings-----------------------{{{ 

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" }}}

"Other Editing Utilities------------------------{{{

"vimrc文件修改之后自动加载, linux
"autocmd! bufwritepost .vimrc source %

" 增强模式中的命令行自动完成操作
set wildmenu
set wildmode =list,full

"autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>


function! Test_Dir_Exist()
  let dir = expand('%:p:h')
  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echom 'Created non-existing directory: '.dir
  endif
endfunction

augroup Utility
    autocmd BufWritePre * call Test_Dir_Exist()
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END
" }}}

"Mapping----------------------{{{ 

"Fundamental Mapping---------------{{{
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap gk k
nnoremap gj j

" 分屏窗口移动, Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H ^
noremap L g_

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

nnoremap <space> viw

" => 选中及操作改键
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
nmap Y y$

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly close the current window
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>

nnoremap <leader>e :e

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" select all
"map <Leader>sa ggVG

" 滚动Speed up scrolling of the viewport slightly
"nnoremap <C-e> 2<C-e>
"nnoremap <C-y> 2<C-y>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :vsp $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

noremap <c-z> <NOP>
noremap <c-s> <NOP>

" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]

" select block
nnoremap <leader>v V`}

nnoremap <leader>u viwU

" w!! to sudo & write a file
"cmap w!! w !sudo tee >/dev/null %
" }}}

"General F1-F12 Mapping-----------------{{{
" F11 行号开关，用于鼠标复制代码用
" 为方便复制，用<F11>开启/关闭行号显示:
"function! HideNumber()
  "if(&relativenumber == &number)
    "set relativenumber! number!
  "elseif(&number)
    "set number!
  "else
    "set relativenumber!
  "endif
  "set number?
"endfunc

"no help,thx
noremap <F1> <NOP>

"nnoremap <F11> :call HideNumber()<CR>
" F3 显示可打印字符开关
"nnoremap <F3> :set list! list?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
"nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

"quickfix
nnoremap <F10> :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
"}}}

"Commandline Mapping--------------------{{{
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}

"Search Utility-------------------------{{{

"进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 去掉搜索高亮
nnoremap <silent><leader>/ :nohls<CR>

" switch # *
nnoremap # *
nnoremap * #

"}}}

"Tab/buffer Related------------------{{{

nnoremap <leader>t :tabnew

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

" Toggles between the active and last active tab "
" The first tab is always 1 "
"let g:last_active_tab = 1
"" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
 "nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
"" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
""nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
"autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 使用方向键切换buffer
"noremap <left> :bp<CR>
"noremap <right> :bn<CR>

" 新建tab  Ctrl+t
"nnoremap <C-t>     :tabnew
"inoremap <C-t>     <Esc>:tabnew

" tab切换
"map <leader>th :tabfirst<cr>
"map <leader>tl :tablast<cr>

"map <leader>tj :tabnext<cr>
"map <leader>tk :tabprev<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprev<cr>

"map <leader>te :tabedit<cr>
"map <leader>td :tabclose<cr>
"map <leader>tm :tabm<cr>

" }}}

"InsertMode Mapping-----------------------{{{
inoremap <c-]> <Esc>

inoremap <c-l> <right>
inoremap <c-h> <left>

inoremap <c-v> <Esc>"+pi
" }}}

" }}}

"FileType Settings------------------------{{{
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype ==# 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype ==# 'python'
         call setline(1, "\#!/usr/bin/env python")
         call append(1, "\# encoding: utf-8")
         "call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

augroup filetype_grp
    autocmd!
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab ai

    autocmd FileType ruby,javascript,html,css,xml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

    autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown onoremap <buffer> ih :<c-u>execute "normal! ?^#\\+\r:nohlsearch\r0vg_" <cr>
    "autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd

    autocmd BufRead,BufNewFile *.part set filetype=html

    "autocmd FileType vim setlocal foldmethod=marker
    "autocmd BufReadPre,BufNewFile .vimrc setlocal foldmethod=marker foldlevel=0 foldlevelstart=0
    "autocmd BufRead,BufNewFile *.vue set filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
    "au BufWinEnter *.php set mps-=<:>
    "autocmd FileType c,cpp,java set mps+= =:;

    "定义函数AutoSetFileHead，自动插入文件头
    autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
augroup END

augroup highlight_grp
    autocmd!
    "设置可以高亮的关键字
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
augroup END

" }}}

"Theme Settings--------------------{{{

" I dont't know why I don't use gvimrc either.
if (has("gui_running"))
    set termguicolors
    set guifont=Source\ Code\ Pro\ SemiBold\ 13
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
else
    if &term ==# "fbterm" || &term ==# "screen"|| &term ==# "rxvt-unicode-256color" || &term ==# "linux"
        set notermguicolors
        "修复tmux的问题
        set t_Co=256
        "colorscheme monokai
    else
        set termguicolors
    endif
endif

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
colorscheme monokai
" theme主题
set background=dark

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"}}}

"Plugin Setting-------------------------{{{

"airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" nerdtree ------------------{{{
if has("gui_running")
    augroup nerdtree_gui
        autocmd!
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    augroup END
else
    augroup nerdtree_cli
        autocmd!
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        "the last remaining window
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    augroup END
endif

noremap <F7> :NERDTreeToggle<CR>

"}}}

"easymotion
noremap <Leader><leader>h <Plug>(easymotion-linebackward)
noremap <Leader><leader>l <Plug>(easymotion-lineforward)

"YCM-------------------------------{{{
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" 触发补全快捷键 
let g:ycm_key_list_select_completion = ['<TAB>'] 
let g:ycm_key_list_previous_completion = ['<c-p>'] 

set completeopt=menu,menuone

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_server_log_level = 'info'
let g:ycm_complete_in_strings = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_show_diagnostics_ui = 1

"white list
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
            \ "python":1,
            \ "java":1,
            \ "vim":1,
            \ "javascript":1,
            \ "html":1,
            \ "make":1,
            \ "markdown":1,
			\ }

"nnoremap <leader>s :YcmCompleter GetType<CR>
" kind of useful
nnoremap <leader>f :YcmCompleter FixIt<CR>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
"}}}

"tags---------------------{{{
"gtk的tag
"set tags+=~/.vim/tags/gtk/gtk-3.0.tags;
"set tags+=~/.vim/tags/gtk/glib-2.0.tags;
""set tags+=~/.vim/tags/gtk/atk-1.0.tags;
""set tags+=~/.vim/tags/gtk/cairo.tags;
"set tags+=~/.vim/tags/gtk/pixman-1.tags;
""set tags+=~/.vim/tags/gtk/pango-1.0.tags;
"set tags+=~/.vim/tags/gtk/gio-unix-2.0.tags;
"set tags+=~/.vim/tags/gtk/gtk-pixbuf-2.0.tags;
"set tags+=~/.vim/tags/gtk/libpng16.tags;

"c tags
"set tags+=~/.vim/tags/c.tags;
"}}}

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<F4>"
"let g:UltiSnipsJumpForwardTrigger="<c-x>"
"let g:UltiSnipsJumpBackwardTrigger="<c-d>"

"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1

set noshowmode

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
"noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>

"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_StlSeparator = { 'left': '', 'right': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn','.hg','.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0}
let g:Lf_Ctags= '/usr/local/bin/gtags' 

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
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_modules = []

"if executable('ctags')
	"let g:gutentags_modules += ['ctags']
"endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
else
    echo "no gtags found,I think you reinstalled the system,take care bro.:)"
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"set global
"let GtagsCscope_Auto_Load = 1
"let GtagsCscope_Auto_Map = 1
"let GtagsCscope_Quiet = 1

let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_plus_nomap = 1

noremap <silent> <leader><leader>s :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader><leader>g :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader><leader>c :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader><leader>t :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader><leader>e :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader><leader>f :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader><leader>i :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader><leader>d :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader><leader>a :GscopeFind a <C-R><C-W><cr>

"}}}

"preview 
"Alt-U and Alt-D to scroll preview
"execute "set <M-u>=\eu"
"execute "set <M-d>=\ed"
"noremap <m-u> :PreviewScroll -1<cr>
"noremap <m-d> :PreviewScroll +1<cr>
"inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
"inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>

"noremap <F2> :PreviewTag<cr> 

"augroup quickfix_preview
    "autocmd!
    "autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    "autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
"augroup END

"noremap <F5> :PreviewSignature!<cr>
"inoremap <F5> <c-\><c-o>:PreviewSignature!<cr>


"delimitmate
let delimitMate_expand_cr = 1

augroup delimit_pair
    autocmd!
    autocmd FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"
augroup END

"colorizer
nnoremap <F12> :ColorToggle<cr>

"sound
let g:keysound_enable = 0
" 设置默认音效主题，可以选择：default, typewriter, mario, bubble, sword
let g:keysound_theme = 'default'
" 设置 python 版本：2 或者3 默认会自动检测
let g:keysound_py_version = 2
" 设置音量：0-1000
let g:keysound_volume = 500

nnoremap <F9> :KeysoundEnable<cr>

"header
let g:header_field_author = 'Linus Boyle'
let g:header_field_author_email = 'linusboyle@gmail.com'
let g:header_auto_add_header = 0
"}}}

"Abbreviation----------------------------{{{

"it's stupid...but useful
iabbrev mian main

iabbrev @@ linusboyle@gmail.com
iabbrev ccopy Copyright 2018 Linus Boyle,all rights reserved
"}}}

" Own Advanced Setting-----------------{{{
function! Find_project_root()

    let l:path = simplify(expand("%:p:h"))
    let l:previous_path = ""
    let l:markers = ['.root','.git','.svn']

    while l:path != l:previous_path
        for root in l:markers
            if !empty(globpath(l:path, root, 1))
                let l:proj_dir = simplify(fnamemodify(l:path, ':p'))
                if l:proj_dir == '/'
                    return ""
                endif
                return l:proj_dir
            endif
        endfor
        let l:previous_path = l:path
        let l:path = fnamemodify(l:path, ':h')
    endwhile
    return ""
endfunction

" grep operator
nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    let saved_unnamed_register = @@
    let project_root=Find_project_root()

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        "ignore multiline mode,just because it's not useful
        return
    endif

    if empty(l:project_root)
        "search in current dir
        silent! execute "grep! " . shellescape(@@)
        silent! execute "redraw!"
    else
        "else search in root dir
        silent! execute "grep! " . shellescape(@@) . " ". project_root
        silent! execute "redraw!"
    endif

    let @@ = saved_unnamed_register
endfunction
" }}}
