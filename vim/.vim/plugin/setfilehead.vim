" setfilehead.vim
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

if exists('g:loaded_setfindhead') || &compatible
  finish
endif

if !has('autocmd') || v:version < 700
  finish
endif

let g:loaded_setfindhead=1

augroup template
    autocmd!
    autocmd BufNewFile *.sh silent 0r $HOME/.vim/template/skeleton.sh
    autocmd BufNewFile *.py silent 0r $HOME/.vim/template/skeleton.py
    autocmd BufWritePre * call <sid>UpdateModifiedTime()
augroup END

function! s:UpdateModifiedTime()
    if line("$") > 20
        let l = 20
    else
        let l = line("$")
    endif
    exe '1,'..l..'s/\(Last Modified\s*:\).*/\1 '..strftime("%F %T").."/eg"
endfunc
