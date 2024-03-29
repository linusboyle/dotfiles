" findRoot.vim
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

let s:markers = ['.root','.git','.svn']

function! findRoot#Find_project_root()
    let l:path = simplify(expand("%:p:h"))
    let l:previous_path = ""

    while l:path != l:previous_path
        for root in s:markers
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
