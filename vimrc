"Pathogen setup
execute pathogen#infect()

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

"Filetype specific settings
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType xml setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType eruby setlocal ts=2 sts=2 sw=2
autocmd FileType sql setlocal noet

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

"Colors
colorscheme zenburn

"Set up powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

"Set gvim start size and font
if has("gui_running")
    if has("win32")
        set guifont=Source_Code_Pro:h9:cANSI
    else
        set guifont=Sauce\ Code\ Powerline\ Light:h11
    endif

    set clipboard=unnamed

    "Remove menu bar and toolbar
    set guioptions-=m
    set guioptions-=T
endif

"Windows specific settings
if has("win32")
    "Set the shell to use powershell instead of cmd
    set shell=powershell.exe
    set shellcmdflag=-command

    if exists("&novsvim_useeditorindent")
        set novsvim_useeditorindent
    endif
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

"NERDTree settings
let g:NERDTreeWinPos = "right"
nnoremap <leader>. :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$']
autocmd vimenter * if !argc() | NERDTree | endif
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

"Fix weird inconsistency with Y
map Y y$

"Make K the opposite of J
nmap K i<CR><esc>k$

"Shift blocks without leaving visual mode
vnoremap < <gv
vnoremap > >gv
