"
" Author: qubex2
" Date: 2015-02-15
" Email: qubex2@gmail.com
"
" ====[ SETTINGS ]==============================================================
set nobackup " no backup files
set backupskip=/tmp/*,/private/tmp/*
set noswapfile
set history=1000
set undolevels=1000
set scrolloff=4
set ruler " always show cursor
set showcmd " show incomplete commands
set incsearch " search as you type
set hlsearch " highlight search matches
set smartcase
set ignorecase
set hidden
set nowrap
set textwidth=79
set autoindent
set formatoptions-=t
" allow backspace to delete end of line, indent and start a line of chars
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouse=a
set number
set relativenumber
"exec "set listchars=tab:\u203a\u2014,trail:\uB7,nbsp:~,eol:\uB6"
exec "set listchars=tab:\u203a\u2014,trail:\uB7,nbsp:~"
set list
set timeout timeoutlen=1000 ttimeoutlen=100
set laststatus=2
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set encoding=utf-8
set autoread
set clipboard=unnamed
set shortmess+=I
set splitbelow
set splitright
set cursorline " highlight the current line
set visualbell
set guifont=Monaco\ 9" Change font
set wildmenu
set lazyredraw
set showmatch
set colorcolumn=80
highlight ColorColumn ctermbg=233
highlight Visual cterm=NONE ctermbg=White ctermfg=Black

" ====[ NETRW ]=================================================================
let g:netrw_liststyle=3

" ====[ NERDTREE ]==============================================================
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" ====[ TAGBAR ]================================================================
let g:tagbar_autofocus=1
let g:tagbar_width=25

" ====[ ULTISNIPS ]=============================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ====[ PHP INDENTATION ]=======================================================
let g:PHP_vintage_case_default_indent = 1

" ====[ PYTHON CONFIGURATION ]==================================================
let g:pymode=1
let g:pymode_indent=1
let g:pymode_folding=1
let g:pymode_rope=1
let g:pymode_rope_completion_bind='<C-Space>'
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_autoimport=1
" let g:pymode_rope_show_doc_bind='K'
let g:pymode_doc=1
let g:pymode_doc_key='K'
let g:pymode_lint=1
let g:pymode_lint_checker="pep8,pyflakes,pylint"
let g:pymode_lint_write=1
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

