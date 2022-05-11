
let mapleader = " "

" Set to use system clipboard.
set clipboard+=unnamedplus

syntax on
set cursorline

" Requirement for polyglot plugin.
" let g:polyglot_disabled = ['markdown']

" Mapleader binds.
noremap <leader><leader> :exit<cr>
noremap <leader>v :vsplit
noremap <leader>t :split<cr>:term<cr>
noremap <leader>w :w<cr>
noremap <leader>W :w<cr>
noremap <leader>q <CR>w
noremap <leader>a ggVG

" Random binds.
noremap <F11> :edit $MYVIMRC<cr>
noremap <F12> :so $MYVIMRC<cr>

" Remap escape to kj
inoremap kj <esc>
vnoremap kj <esc>

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
nnoremap <space> <nop>

" Fix tex file type
autocmd BufRead, BufNewFile *.tex set filetype=tex
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us

" Random formatting stuff.
autocmd InsertEnter * norm zz
autocmd BufWritePre * %s/\s\+$//e

set number
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set textwidth=79
set showmatch


" Plugins
call plug#begin('C:\Users\Admin\AppData\Local\nvim-data\site\autoload\plugged')

    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'sheerun/vim-polyglot'
    Plug 'ghifarit53/tokyonight-vim'

call plug#end()

" Tokyo Night Theme
set termguicolors

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" syntax on
" colorscheme onedark
