" Enable sensible.vim
runtime macros/matchit.vim

" Activate pathogen package manager
call pathogen#infect()
syntax enable
filetype plugin indent on
call pathogen#helptags()

set history=5000
set showcmd
set autoread

set wildmenu
set wildmode=longest:list,full

set bg=dark

imap kj <Esc>
set whichwrap=b,h,l,<,>,[,]
set tabstop=2 shiftwidth=2 expandtab autoindent
set number
set hidden
retab

" Fix Ctrl/Shift - arrow keys
map <ESC>[1;5C <C-Right>
map! <ESC>[1;5C <C-Right>
map <ESC>[1;6C <C-S-Right>
map! <ESC>[1;6C <C-S-Right>
map <ESC>[1;2C <S-Right>
map! <ESC>[1;2C <S-Right>

map <ESC>[1;5D <C-Left>
map! <ESC>[1;5D <C-Left>
map <ESC>[1;6D <C-S-Left>
map! <ESC>[1;6D <C-S-Left>
map <ESC>[1;2D <S-Left>
map! <ESC>[1;2D <S-Left>

map [1;5A <C-Up>
map [1;5B <C-Down>
map! [1;5A <C-Up>
map! [1;5B <C-Down>


" Remap switch to another split
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Remap split resize
nmap rj :resize +5<CR>
nmap rk :resize -5<CR>
nmap rh :vertical resize -5<CR>
nmap rl :vertical resize +5<CR>

" Buffers
nnoremap <silent> <S-k> :BufExplorer<CR>
nnoremap <silent> <S-l> :bn<CR>
nnoremap <silent> <S-h> :bp<CR>

" Setup NERDTree
map <C-n> :NERDTreeToggle<CR>

" Remove trailing white space
autocmd BufWritePre *.rs,*.rb,*.rake,*.erb,*.js,*.coffee,*.txt,*.TXT,*.yaml,*.md,*.MD,*.dust,*.yml,*.gemspec :%s/\s\+$//e

" Map toggle fold to Enter
nmap <Enter> za
highlight Folded ctermbg=none ctermfg=darkcyan

" Fold CoffeeScript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" Config for StatusLineHightlight plugin
highlight StatusLineModified term=bold,reverse cterm=bold,reverse ctermfg=LightGreen gui=bold,reverse guifg=LightGreen
highlight StatusLineModifiedNC term=reverse cterm=reverse ctermfg=LightGreen gui=reverse guifg=LightGreen

" CursorLine
set cursorline
highlight clear CursorLine
highlight CursorLineNR cterm=bold ctermfg=Yellow
highlight LineNr cterm=NONE ctermfg=DarkGray

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diff call s:DiffWithSaved()

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
