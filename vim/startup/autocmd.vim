"
" Author: qubex2
" Date: 2015-02-15
" Email: qubex2@gmail.com
"
" ====[ Startup Scripts ]=======================================================
let b:startup_dir = $HOME . '/.vim/startup/'
let b:startup_scripts = ['settings.vim', 'autocmd.vim', 'mappings.vim', 'functions.vim']
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    for script in b:startup_scripts
        execute 'autocmd BufWritePost ' . b:startup_dir . script . ' source ' . b:startup_dir . script
    endfor
augroup END

" ====[ Folding options ]=======================================================
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" ====[ Set vim options ]=======================================================
autocmd FileType vim call SetVimOptions()

function! SetVimOptions()
    setlocal keywordprg=:help
    setlocal formatoptions-=cro
endfunction


