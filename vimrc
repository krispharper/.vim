"vim-plug setup
call plug#begin()
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'tex' }
Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
Plug 'elubow/cql-vim', { 'for': 'cql' }
Plug 'krispharper/zenburn'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/BufClose.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()

"Change leader
let mapleader = ","

"Turn off beeping
set noeb vb t_vb=

"Allow edited hidden buffers
set hidden

"Indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"FileType specific settings
autocmd FileType html,xml setlocal ts=2 sts=2 sw=2
autocmd FileType ruby,eruby setlocal ts=2 sts=2 sw=2 ofu=rubycomplete#Complete
autocmd FileType sql setlocal noet

let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

"Set autocomplete for rails
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"Default TeX files to be LaTeX files
let g:tex_flavor = "latex"

"Set casing options
set ignorecase
set smartcase

"Relative numbering
set number
set relativenumber

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<CR>

"Disable syntastic when saving certain filetypes
let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["python"] }

"Colors
colorscheme zenburn
if !has("win32")
    let g:zenburn_transparent=1
endif

"Set up powerline
if has("win32")
    if has("gui_running")
        set rtp+=C:\Program\ Files\ (x86)\Python27\Lib\site-packages\powerline\bindings\vim
    endif
else
    set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
endif

"Set gvim settings
if has("gui_running")
    if has("win32")
        set guifont=Source_Code_Pro_for_Powerline:h9:cANSI
    else
        if system("uname") == "Darwin\n"
            set guifont=Sauce\ Code\ Powerline\ Light:h11
        else
            set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 8
        endif
    endif

    set clipboard^=unnamed,unnamedplus

    "Remove menu bar and toolbar
    set guioptions-=m
    set guioptions-=T
endif

"Fold settings
set foldmethod=indent
set foldnestmax=2
set foldlevel=1000
nnoremap <space> za
nnoremap zC zM
nnoremap zO zR

"Save fold settings on exit and reload on start
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"Ignore some directories when searching files
set wildignore+=**/node_modules/**,**/bin/**

"NERDTree settings
let g:NERDTreeWinPos = "right"
nnoremap <leader>. :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$']
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Change CtrlP behavior
let g:ctrlp_cmd = 'CtrlPMixed'

"Buffer switching
:nnoremap <C-b> :buffers<CR>:buffer<Space>

"Open all buffers in tabs
map <leader>bt :tab sball<CR>

"Tab navigation
map <C-H> :tabp<CR>
map <C-L> :tabn<CR>
map <C-T> :tabnew %<CR>

map <leader>w :cw<CR>:wincmd J<CR>

"Format JSON
nmap =j :%!python -m json.tool<CR>

"Fix weird inconsistency with Y
map Y y$

"Make K the opposite of J
nmap K i<CR><esc>k$

"Shift blocks without leaving visual mode
vnoremap < <gv
vnoremap > >gv
