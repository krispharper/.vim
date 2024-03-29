"vim-plug setup
call plug#begin()
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'tex' }
Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elubow/cql-vim', { 'for': 'cql' }
Plug 'elzr/vim-json'
Plug 'embear/vim-localvimrc'
Plug 'junegunn/fzf', { 'dir': '~/Development/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'krispharper/vim-conceal'
Plug 'krispharper/zenburn'
Plug 'leafgarland/typescript-vim'
Plug 'machakann/vim-swap'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/BufClose.vim'
Plug 'w0rp/ale'
Plug 'wfxr/minimap.vim'
Plug 'whiteinge/diffconflicts'
call plug#end()

source ~/.vim/vimrc.local

"Change leader
let mapleader = ","

"Turn off beeping
set noeb vb t_vb=

"Allow edited hidden buffers
set hidden

"Enable mouse
set mouse=a

"Indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"FileType specific settings
autocmd FileType html,xml setlocal ts=2 sts=2 sw=2
autocmd FileType ruby,eruby setlocal ts=2 sts=2 sw=2 ofu=rubycomplete#Complete
autocmd FileType tf setlocal ts=2 sts=2 sw=2

" Spell-check Markdown files and Git Commit Messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType pullrequest setlocal spell

"Turn on conceal
set conceallevel=1

let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

"Jedi settings
let g:jedi#use_tabs_not_buffers = 1  " use buffers instead of tabs
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_assignments_command = "<leader>d"
let g:jedi#goto_definitions_command = "<leader>dd"
let g:jedi#documentation_command = "<leader>k"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"

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

"Undo on closed files
set undofile
set undodir=~/.vim/.undo//

"Consolidate swp files 
set directory=~/.vim/.swp//

"Colors
colorscheme zenburn
if !has("win32")
    let g:zenburn_transparent=1
endif

"Set gvim settings
if has("gui_running")
    if system("uname") == "Darwin\n"
        set guifont=SourceCodeProForPowerline-Regular:h12
    else
        set guifont=Source\ Code\ Pro\ 8
    endif

    set clipboard^=unnamed,unnamedplus

    "Remove menu bar and toolbar
    set guioptions-=m
    set guioptions-=T
else
    set clipboard^=unnamed
endif

"Set Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#show_close_button = 1


"Set Prompline settings
let g:promptline_preset = {
    \'a' : [ '$vim_mode' ],
    \'b' : [ promptline#slices#host(), promptline#slices#user() ],
    \'c' : [ promptline#slices#cwd() ],
    \'y' : [ promptline#slices#git_status(), promptline#slices#vcs_branch() ],
    \'z' : [ promptline#slices#conda_env(), '$(echo $VIRTUAL_ENV | cut -f 8 -d"/" | cut -f 1 -d"-")'],
    \'warn' : [ promptline#slices#last_exit_code() ]}

"Fold settings
set foldmethod=indent
set foldnestmax=2
set foldlevel=1000
nnoremap <space> za
nnoremap zC zM
nnoremap zO zR

"Ignore some directories when searching files
set wildignore+=**/node_modules/**,**/bin/**,**/build/**,**/app/**

"NERDTree settings
let g:NERDTreeWinPos = "right"
nnoremap <leader>. :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$']
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Add fzf mappings
map <leader>f :FZF<CR>
map <leader>a :Ag<CR>

"Load local vimrcs without asking
let g:localvimrc_ask=0

"Buffer switching
:nnoremap <leader>b :Buffers<CR>

"Open all buffers in tabs
map <leader>bt :tab sball<CR>

"Buffer navigation
map <C-H> :bprevious<CR>
map <C-L> :bnext<CR>
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
