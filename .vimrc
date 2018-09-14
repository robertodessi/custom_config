let python_highlight_all=1
syntax on

set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set number
set cursorline

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap sd <Esc>
nnoremap w b
nnoremap 1 0
nnoremap 2 $
" <BS> is backspace i.e. delete key
inoremap ` <BS>
"noremap ;; :

nnoremap ; :
nnoremap : ;

nnoremap <Space> G

" <cr> is the enter key
inoremap ,, <cr>
" fd then number of buffer and it will open that
nnoremap fd :ls<CR>:b<Space>

"inoremap ss <Esc>:w<CR> 
nnoremap ss :w<CR> 
"inoremap sw <Esc>:wq<CR> 
nnoremap sw :wq<CR>

command Bd bp | sp | bn | bd

" foldin with space
nnoremap <space> za  

set swapfile
set dir=~/.swap_vim

"inoremap a h 
"inoremap s j 
"inoremap w k  
"inoremap d l 

 
" " Enable folding
" " set foldmethod=indent
"  set foldlevel=99

" to check runtimepath = set runtimepath?
set runtimepath+=~/.vim/SimpylFold/




