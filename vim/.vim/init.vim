" init.vim
" Copyright (c) 2019 Zhilei Han <hzl17@mails.tsinghua.edu.cn>
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

" All the config should be sourced only once
" I'm hoping the vimrc file can be easily re-sourced without
" much overhead

" add merlin plugin for ocaml
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Load third-party plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'

Plug 'unblevable/quick-scope'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/LeaderF'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'Lokaltog/vim-easymotion'
Plug 'mhinz/vim-grepper'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'skywind3000/asyncrun.vim'
Plug 'sirver/ultisnips'
Plug 'whonore/Coqtail'
"Plug 'neomake/neomake'
Plug 'wellle/targets.vim'
Plug 'jpalardy/vim-slime'
Plug 'luochen1990/rainbow'
Plug 'ycm-core/YouCompleteMe'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'michal-h21/vim-zettel'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'dominikduda/vim_current_word'
Plug 'liuchengxu/vim-which-key'
Plug 'wellle/context.vim'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'rhysd/vim-llvm'
Plug 'let-def/ocp-indent-vim'
Plug 'derekwyatt/vim-scala'
Plug 'wlangstroth/vim-racket'
Plug 'plasticboy/vim-markdown'
Plug 'octol/vim-cpp-enhanced-highlight', {'for' : 'cpp'}
Plug 'bohlender/vim-smt2'
Plug 'camilstaps/vim-smv'
Plug 'ferrine/md-img-paste.vim'

call plug#end()

colorscheme sahara
" third party colorschemes are only
" available after vim-plug init.
"if has('gui_running')
    "colorscheme sahara
"endif

" the configuration after here
" cannot be modified on the fly
if get(g:, 'global_config_guard', 0)
    finish
endif

let g:global_config_guard=1

" some commands
command -nargs=0 SConfig source $MYVIMRC
command -nargs=0 EConfig edit $MYVIMRC

" tweaks of the builtin and handwritten plugins
let g:no_ocaml_maps=1
let g:tex_flavor="latex"

runtime keymap.vim
runtime thirdparty.vim

" it's stupid...but useful
iabbrev mian main
iabbrev ture true
iabbrev fasle false
iabbrev tihs this
iabbrev @@ hzl17@mails.tsinghua.edu.cn
