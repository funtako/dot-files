set rnu "relative line numbers
set nu " line number
syntax on "basic highlighting
set noerrorbells " no sounds
set tabstop=4 softtabstop=4 
set shiftwidth =4
set expandtab "convert tab to spaces
set smartindent "will try to indent 
set nowrap "no line wrap
set ignorecase "case insensitive search
set noswapfile "won't create vim.swap files throught project.
set nobackup 
set undodir=~/.vim/undordir
set undofile
set incsearch "incremental search
set scrolloff=16 "start scrolling down when you are 8 away from the bottom of the page.
set colorcolumn=80
set signcolumn=yes " column on the left hand side that can show an error e with git integration 




call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
call plug#end()

colorscheme gruvbox
set background=dark


if executable('rg')
    let:g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-sta
let mapleader = " " " set space bar as leader key
let g:netrw_browse_split=2
let g:netrw_banner =0
let g:netrw_winsize = 25



" ag is fast enough that CtrlP doesn't need to cache"
let g:ctrlp_use_caching = 0


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR> "projectview
nnoremap <leader>ps :Rg<SPACE> <CR> "projectwide search
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>


"YCM
"The best part.
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>




"copy to clipboard
vnoremap <c-c> "+y


set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline


