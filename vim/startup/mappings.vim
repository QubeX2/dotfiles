"
" Author: qubex2
" Date: 2015-02-15
" Email: qubex2@gmail.com
"
" ====[ Leader ]================================================================
let mapleader = ','

" ====[ Initial mappings ]======================================================
noremap <down> ddp
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> ddkP
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>
nnoremap ö :
vnoremap ö :

" ====[ Search and Replace ]====================================================
nnoremap . ;
nnoremap ; :/
noremap <Leader>h :nohl<CR>
nmap <Leader>fs :Ack -i -Q -H ""<Left>
nmap <Leader>fk :Ack -i -Q -H "<cword>"<CR>
map <Leader>ws m':%s/\s\+$//<CR>''
nmap <Leader>sf m'gg=G''

" ====[ Indentation ]===========================================================
vnoremap < <gv
vnoremap > >gv

" ====[ Load bundles ]==========================================================
map <silent> <Leader>n :NERDTreeToggle<CR>
map <silent> <Leader>f :CtrlP<CR>
map <silent> <Leader>b :CtrlPBuffer<CR>
map <silent> <Leader>m :CtrlPMRU<CR>
nmap <silent> <Leader>r <Esc>:TagbarToggle<CR>

" ====[ Editing ]===============================================================
nmap ä $
vmap ä $
nnoremap <Leader>so :source %<CR>
inoremap jk <Esc>
imap <C-d> <Esc>ddi
nmap <C-å> <C-]>
nmap Y y$
map <Leader>a ggVG
nnoremap <Leader>o :e #<CR>
" ====[ Window movements ]======================================================
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" ====[ Configfiles ]===========================================================
nmap <Leader>ev :tabe ~/.vim/vimrc<CR>
nmap <Leader>em :tabe ~/.vim/startup/mappings.vim<CR>
nmap <Leader>es :tabe ~/.vim/startup/settings.vim<CR>
nmap <Leader>ea :tabe ~/.vim/startup/autocmd.vim<CR>
nmap <Leader>ef :tabe ~/.vim/startup/functions.vim<CR>

