set encoding=utf-8
set relativenumber
" set colorcolumn=120
set modifiable
set shiftwidth=2

let g:io_flag = 0

" =================== Essential =================== "
set formatoptions-=c formatoptions-=r formatoptions-=o

let mapleader = " "

" Set to use system clipboard.
set clipboard+=unnamedplus
set mouse=a

syntax enable
filetype plugin indent on

set formatoptions-=cro
set splitright


function! ToggleIO()
    if g:io_flag == 0
        let g:io_flag = 1
        :vsplit ./output.txt
        :split ./input.txt
        :vertical resize -24
    else
        let g:io_flag = 0
        :exit
        :exit
    endif
endfunction

" =================== Keybinds =================== "

" Mapleader binds.
nnoremap T :FloatermToggle<CR>
nnoremap <leader>c :call ToggleIO()<cr>

tnoremap T <C-\><C-n>:FloatermToggle<CR>
noremap <leader><leader><leader> :exit<cr>
noremap <F2> :so $MYVIMRC<cr>
noremap <leader>v :vsplit
noremap <leader>w :w<cr>
noremap <leader>W :w<cr>
noremap <leader>a ggVG
noremap <leader>z :noh<cr>
noremap <leader>t :execute "read template.cpp"<cr>
noremap <leader>j 10j
noremap <leader>k 10k
noremap <leader>h 20h
noremap <leader>l 20l
noremap <leader>. 10<C-w><
noremap <leader>, 10<C-w>>
noremap <leader>d :r!cd<cr>ddk
noremap <leader>s mqA;<esc>`q
noremap <leader>s mqA;<esc>`q
noremap F <C-f>
noremap D <C-b>
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>p :exit<cr><bar>:exit<cr>

" if &ft=='c'
"   nnoremap <leader>r :vsplit term://gcc % && a.exe<CR>
" elseif &ft=='cpp'
"   nnoremap <leader>r :vsplit term://g++ % && a.exe <CR>
" elseif &ft=='python'
"   nnoremap <leader>r :vsplit term://python %<CR>
" elseif &ft=='js'
"   nnoremap <leader>r :vsplit term://node %<CR>
" endif

" Non-leader binds.
noremap <F1> :edit $MYVIMRC<cr>
" noremap <F2> :so $MYVIMRC<cr>

" map <tab>  <C-w>w
map \ <cmd>Telescope find_files<CR>

" Remap escape to kj
inoremap kj <esc>
vnoremap kj <esc>
inoremap KJ <esc>
vnoremap KJ <esc>

map <tab>  <C-w>w
imap <C-BS> <C-W>

map <up> <nop>
imap <up> <nop>
map <down> <nop>
imap <down> <nop>
map <left> <nop>
imap <left> <nop>
map <right> <nop>
imap <right> <nop>
nnoremap <space> <nop>

" =================== Formatting =================== "

" Fix tex file type
autocmd BufRead, BufNewFile *.tex set filetype=tex
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us

" Random formatting stuff.
autocmd InsertEnter * norm zz
autocmd BufWritePre * %s/\s\+$//e

set number
set encoding=utf-8
set expandtab
set softtabstop=4
" set autoindent
set textwidth=79
set showmatch

" =================== Plugins and Themes =================== "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('C:\Users\hans\AppData\Local\nvim\autoload\plugged')

    Plug 'rust-lang/rust.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'mg979/vim-visual-multi'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    " Plug 'tiagovla/tokyodark.nvim'
    Plug 'morhetz/gruvbox'
    Plug 'ryanoasis/vim-devicons'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'voldikss/vim-floaterm'
    Plug 'dense-analysis/ale'

call plug#end()

let g:python_highlight_space_errors = 0

set termguicolors

" Tokyodark configs

" let g:tokyodark_transparent_background = 1
" let g:tokyodark_enable_italic_comment = 1
" let g:tokyodark_enable_italic = 1

let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_bold=1
colorscheme gruvbox

" Vim airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1

if has('persistent_undo')      "check if your vim version supports it
set undofile                 "turn on the feature
set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

let g:floaterm_title='Terminal'
let g:floaterm_width=0.8
let g:floaterm_position='bottom'

let g:ale_c_cpp_checkers = ['compile_commands']

let g:ale_cpp_parse_compile_commands=1
let g:ale_cpp_parse_makefile = 1
