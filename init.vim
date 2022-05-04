
let mapleader = ","
let g:polyglot_disabled = ['markdown']


" mapleader stuff
noremap <leader>t :term<cr>
noremap <leader>c gcc

" Set to use system clipboard.
set clipboard+=unnamedplus

" Fix tex file type
autocmd BufRead, BufNewFile *.tex set filetype=tex

noremap <leader>c gcc
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us

" Vertical Center
autocmd InsertEnter * norm zz

" Remove whitespace
autocmd BufWritePre * %s/\s\+$//e

" set nocompatible

" Plugins
call plug#begin('C:\Users\Admin\AppData\Local\nvim-data\site\autoload\plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'joshdick/onedark.vim'

call plug#end()

" Random formatting stuff.
set number
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4

" Disable arrow keys lol
map <up> <nop>
imap <up> <nop>
map <down> <nop>
imap <down> <nop>
map <left> <nop>
imap <left> <nop>
map <right> <nop>
imap <right> <nop>
map <F2> i<CR><ESC>

" Remap escape to kj
inoremap kj <esc>
vnoremap kj <esc>

" Tokyo Night Theme
set termguicolors

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
" syntax on
" colorscheme onedark
