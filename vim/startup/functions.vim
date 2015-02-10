"
" Author: qubex2
" Date: 2015-02-15
" Email: qubex2@gmail.com
"

" ====[ Highlight matches when jumping ]========================================
nnoremap <silent> n n:call HLNext(0.4)<CR>
nnoremap <silent> N N:call HLNext(0.4)<CR>
highlight WhiteOnRed cterm=bold ctermfg=White ctermbg=Red

function! HLNext(blinktime)
    " list unpack
    let [bufnum, lnum, col, off] = getpos('.')
    " \c - ignorecas, \%# - at cursor position, . - concats strings
    " @ - get register, / - last search pattern register
    let pattern = '\c\%#' . @/
    let blinks = 3
    for n in range(1, blinks)
        let red = matchadd('WhiteOnRed', pattern)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
        call matchdelete(red)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
    endfor
endfunction

" ====[ Toggle comments ]=======================================================
autocmd FileType *sh,awk,python,perl,ruby let b:cmt = exists('b:cmt') ? b:cmt : '#'
autocmd FileType vim let b:cmt = exists('b:cmt') ? b:cmt : '"'
autocmd FileType c,cpp,php,js let b:cmt = exists('b:cmt') ? b:cmt : '//'
autocmd FileType lisp let b:cmt = exists('b:cmt') ? b:cmt : ';;'
autocmd BufNewFile,BufRead *.vim,.vimrc,vimrc let b:cmt = exists('b:cmt') ? b:cmt : '"'
autocmd BufNewFile,BufRead *.js,*.php,*.c,*.cpp let b:cmt = exists('b:cmt') ? b:cmt : '//'
autocmd BufNewFile,BufRead *.lisp,*.el let b:cmt = exists('b:cmt') ? b:cmt : ';;'
autocmd BufNewFile,BufRead *.sh let b:cmt = exists('b:cmt') ? b:cmt : '#'

function! ToggleComment(cmt_char, cur_line)
    let line = ''
    if a:cur_line =~ '^ *' . a:cmt_char
        let line = substitute(a:cur_line, '^\( *\)' . a:cmt_char, '\1', "")
    else
        let line = substitute(a:cur_line, '^\( *\)', '\1' . a:cmt_char, "")
    endif
    return line
endfunction

function! ToggleCommentLine()
    let cmt_char = exists('b:cmt') ? b:cmt : '#'
    " get line returns a string
    let cur_line = getline('.')
    let line = ToggleComment(cmt_char, cur_line)
    echom line
    call setline('.', line)
endfunction

function! ToggleCommentBlock() range
    let cmt_char = exists('b:cmt') ? b:cmt : '#'
    " start at the first line
    let line_num = a:firstline
    " get line returns a list
    let lines = getline(a:firstline, a:lastline)
    for line in lines
        let line = ToggleComment(cmt_char, line)
        call setline(line_num, line)
        let line_num += 1
    endfor
endfunction

nmap <silent> # :call ToggleCommentLine()<CR>j0
vmap <silent> # :call ToggleCommentBlock()<CR>

