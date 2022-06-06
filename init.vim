set modifiable

" =================== Essential =================== "
set formatoptions-=c formatoptions-=r formatoptions-=o

let mapleader = " "

" Set to use system clipboard.
set clipboard+=unnamedplus
set mouse=a

syntax on
" set cursorline

" Requirement for polyglot plugin.
let g:polyglot_disabled = ['markdown']

" =================== Keybinds =================== "

" Mapleader binds.
noremap <leader><leader><leader> :exit<cr>
noremap <leader>v :vsplit
noremap <leader>t :split<cr>:term<cr>
noremap <leader>w :w<cr>
noremap <leader>W :w<cr>
noremap <leader>a ggVG
noremap <leader>z :noh<cr>
noremap <leader>f /
noremap <leader>j 10j
noremap <leader>k 10k
noremap <leader>h 20h
noremap <leader>l 20l
noremap <leader>, 10<C-w><
noremap <leader>. 10<C-w>>
noremap <leader>d :r!cd<cr>ddk

" Random binds.
noremap <F1> :edit $MYVIMRC<cr>
noremap <F2> :so $MYVIMRC<cr>
map ` :NERDTreeToggle<cr>
map <tab>  <C-w>w
map \ <cmd>Telescope find_files<CR>

" Remap escape to kj
inoremap kj <esc>
vnoremap kj <esc>
inoremap KJ <esc>
vnoremap KJ <esc>

" Disable arrow keys lol
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
set shiftwidth=4
set softtabstop=4
" set autoindent
set textwidth=79
set showmatch

" =================== Plugins and Themes =================== "

call plug#begin('C:\Users\Admin\AppData\Local\nvim-data\site\autoload\plugged')

    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tiagovla/tokyodark.nvim'
    Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:python_highlight_space_errors = 0

set termguicolors

" Tokyodark configs

let g:tokyodark_transparent_background = 1
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1
colorscheme tokyodark



" Vim airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'

let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD

let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

" NERDTree auto commands
autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

lua <<EOF
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
        },
    indent = {
        enable = false,
        disable = {},
        }
    }

EOF
