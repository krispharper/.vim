"Turn on filetype settings
filetype on
filetype plugin on
syntax on

"Show partial commands
set showcmd

"Show the cursor position
set ruler

"Do incremental searches
set incsearch

"Display most of a long line at the end of a screen
set display+=lastline

"Always show the status line
set laststatus=2

"Turn off beeping
set noeb vb t_vb=

"Indent settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set softtabstop=4

"Set casing options
set ignorecase
set smartcase

"Allow use of backspace key for deletion
set backspace=indent,eol,start

"Relative numbering
set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"Colors
colorscheme default
highlight SpellBad term=Reverse ctermbg=Red ctermfg=White

"Allow XML and HTML tag matching
runtime macros/matchit.vim

"Set gvim start size and font
if has("gui_running")
    au GUIEnter * simalt ~x
    set guifont=consolas:h9:cANSI
endif

"Windows specific settings
if has("win32")
    "Set the shell to use powershell instead of cmd
    set shell=powershell.exe
    set shellcmdflag=-command

    "Explicitly set path to ctags
    let Tlist_Ctags_Cmd = 'C:\Windows\System32\ctags.exe'
endif

"Fold settings
set foldmethod=indent
set foldnestmax=2
set foldlevel=1000
nnoremap <space> za
nnoremap zc zM
nnoremap zo zR

"Taglist settings
map T :TlistToggle<CR>

"NERDTree settings
let g:NERDTreeWinPos = "right"
nnoremap <C-\> :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$']

"Buffer switching
:nnoremap <C-b> :buffers<CR>:buffer<Space>

"Easier navigation
"Test if we're on OS X or not because it reads arrow keys differently
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        nnoremap ^[[5B <C-e>
        nnoremap ^[[5A <C-y>
        nnoremap [5D :tabprevious<CR>
        nnoremap [5C :tabnext<CR>
    else
        nnoremap <C-Down> <C-e>
        nnoremap <C-Up> <C-y>
        map <C-left> :tabp<CR>
        map <C-right> :tabn<CR>
    endif
endif
map <C-T> :tabnew %<CR>

"Fix weird inconsistency with Y
map Y y$

"Make K the opposite of J
nmap K i<CR><esc>k$

"Shift blocks without leaving visual mode
vnoremap < <gv
vnoremap > >gv
