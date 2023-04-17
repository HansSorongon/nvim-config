set relativenumber
set splitright
set modifiable
set shiftwidth=2
" =================== Essential =================== "
set formatoptions-=c formatoptions-=r formatoptions-=o

let mapleader = " "

" Set to use system clipboard.
set clipboard+=unnamedplus
set mouse=a

syntax on

set formatoptions-=cro
" =================== Keybinds =================== "

" Normal mode mapleader binds
nnoremap <C-f> :FloatermToggle<CR>
tnoremap <C-f> <C-\><C-n>:FloatermToggle<CR>
noremap <leader><leader><leader> :exit<cr>
noremap <leader>v :vsplit
noremap <leader>w :w<cr>
noremap <leader>W :w<cr>
noremap <leader>a ggVG
noremap <leader>z :noh<cr>
noremap <leader>j 10j
noremap <leader>k 10k
noremap <leader>h 20h
noremap <leader>l 20l
noremap <leader>, 10<C-w><
noremap <leader>. 10<C-w>>
noremap <leader>d :r!cd<cr>ddk
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>s mqA;<esc>`q

" Non-leader binds.
noremap <F1> :edit $MYVIMRC<cr>
noremap <F2> :so $MYVIMRC<cr>

map <tab>  <C-w>w
map \ <cmd>Telescope find_files<CR>

" Remap escape to kj
inoremap kj <esc>
vnoremap kj <esc>
inoremap KJ <esc>
vnoremap KJ <esc>

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

call plug#begin('~/.config/nvim/plugged')

    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'mg979/vim-visual-multi'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'tiagovla/tokyodark.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'vimwiki/vimwiki'
    Plug 'voldikss/vim-floaterm'

    Plug 'lervag/vimtex'

call plug#end()

let g:python_highlight_space_errors = 0

set termguicolors

" Tokyodark configs

let g:tokyodark_transparent_background = 1
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 0
colorscheme tokyodark

" Vim airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'
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

" " NERDTree auto commands
" autocmd VimEnter * NERDTree
" autocmd VimEnter * NERDTree | wincmd p
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

lua require('lsp_config')

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

nnoremap <leader>t :-1read $HOME/.config/nvim/templates/template.cpp<CR>

if &ft=='c'
  nnoremap <leader>t :-1read $HOME/.config/nvim/templates/template.c<CR>
elseif &ft=='cpp'
  nnoremap <leader>t :-1read $HOME/.config/nvim/templates/template.cpp<CR>
  nnoremap <leader>cp :-1read $HOME/.config/nvim/templates/cptemplate.cpp<CR>:178<CR>
endif

if &ft=='c'
  nnoremap <leader>r :vsplit term://crc %<CR>
elseif &ft=='cpp'
  nnoremap <leader>r :vsplit term://cr %<CR>
elseif &ft=='python'
  nnoremap <leader>r :vsplit term://python %<CR>
elseif &ft=='js'
  nnoremap <leader>r :vsplit term://node %<CR>
endif

filetype plugin indent on
syntax enable
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
\ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_quickfix_mode=0


autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

set nocompatible
filetype plugin on
syntax on

hi VimwikiItalic term=italic ctermfg=Blue guifg=#3672B6 gui=italic

let g:floaterm_position = 'bottom'
let g:floaterm_width = 0.8

let g:floaterm_borderchars = 'ΓöÇΓöéΓöÇΓöéΓò¡Γò«Γò»Γò░'
